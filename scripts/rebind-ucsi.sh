#!/usr/bin/env bash
set -euo pipefail

device="USBC000:00"
driver="/sys/bus/platform/drivers/ucsi_acpi"
ac_online="/sys/class/power_supply/AC/online"
logfile="/tmp/ucsi-rebind-$(date +%Y%m%d-%H%M%S).log"

exec > >(tee "$logfile") 2>&1
printf 'Diagnostic log: %s\n' "$logfile"

if [[ ! -e "$driver/unbind" || ! -e "$driver/bind" ]]; then
  printf 'UCSI ACPI driver controls not found at %s\n' "$driver" >&2
  exit 1
fi

if [[ -r "$ac_online" && "$(<"$ac_online")" != "1" ]]; then
  printf 'Connect AC power before resetting the USB-C controller.\n' >&2
  exit 1
fi

printf 'This briefly resets USB-C and may disconnect dock peripherals or charging.\n'
read -r -p 'Continue? [y/N] ' answer
if [[ ! "$answer" =~ ^[Yy]([Ee][Ss])?$ ]]; then
  printf 'Cancelled; no changes made.\n'
  exit 0
fi

sudo -v
started="$(date --iso-8601=seconds)"
printf 'Rebinding %s through %s...\n' "$device" "$driver"

sudo sh -eu -c '
  device=$1
  driver=$2
  unbound=0
  rebind() {
    if [ "$unbound" -eq 1 ]; then
      printf "%s\n" "$device" > "$driver/bind"
    fi
  }
  trap rebind EXIT
  printf "%s\n" "$device" > "$driver/unbind"
  unbound=1
  sleep 2
  printf "%s\n" "$device" > "$driver/bind"
  unbound=0
  trap - EXIT
' sh "$device" "$driver"
printf 'UCSI driver rebind completed.\n'

sleep 5

printf '\n--- Type-C partner ---\n'
partner="/sys/class/typec/port0-partner"
if [[ -d "$partner" ]]; then
  for attr in number_of_alternate_modes supports_usb_power_delivery; do
    [[ -r "$partner/$attr" ]] && printf '%s=%s\n' "$attr" "$(<"$partner/$attr")"
  done
else
  printf 'No Type-C partner registered.\n'
fi

printf '\n--- Type-C partner alternate modes ---\n'
found_partner=0
for path in /sys/bus/typec/devices/port0-partner.*; do
  [[ -e "$path" ]] || continue
  found_partner=1
  printf '%s: ' "${path##*/}"
  for attr in svid active vdo; do
    [[ -r "$path/$attr" ]] && printf '%s=%s ' "$attr" "$(<"$path/$attr")"
  done
  printf '\n'
done
if [[ "$found_partner" -eq 0 ]]; then
  printf 'No partner alternate-mode entries found.\n'
fi

printf '\n--- DRM DisplayPort connectors ---\n'
for path in /sys/class/drm/card1-DP-*; do
  [[ -r "$path/status" ]] || continue
  printf '%s status=%s enabled=%s modes=' \
    "${path##*/}" "$(<"$path/status")" "$(<"$path/enabled")"
  if [[ -r "$path/modes" ]]; then
    tr '\n' ' ' < "$path/modes"
  fi
  printf '\n'
done

printf '\n--- Relevant kernel messages since reset ---\n'
sudo journalctl -k --since "$started" --no-pager -o short-iso |
  grep -Ei 'ucsi|typec|altmode|displayport|i915|ACT after|BadDLLP|bridge window|xhci|hotplug' ||
  true
