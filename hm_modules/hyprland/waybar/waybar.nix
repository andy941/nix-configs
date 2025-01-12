{ pkgs, lib, config, ... }:

{
  options = { waybar.enable = lib.mkEnableOption "enables waybar"; };

  config = lib.mkIf config.waybar.enable {
    programs.waybar = {
      enable = true;
      systemd.enable = true;
    };

    services.network-manager-applet.enable = true;
    services.blueman-applet.enable = true;

    wayland.windowManager.hyprland.settings = {
      exec-once = [ "sleep 10; blueman-tray" ]; # FIX: why is this even needed ...
    };
  };
}
