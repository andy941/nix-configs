{ pkgs, lib, ... }: {
  imports = [
    ./nixSettings.nix
    ./grub.nix
    ./swapFile.nix
    ./locale.nix
    ./corePkgs.nix
    ./pipewire.nix
    ./bluetooth.nix
    ./qbittorrent.nix
    ./plex.nix
  ];

  corePkgs.enable = lib.mkDefault true;
  nixSettings.enable = lib.mkDefault true;
  locale.enable = lib.mkDefault true;
  grub.enable = lib.mkDefault true;

  # Desktop
  swapFile.enable = lib.mkDefault true;
  pipewire.enable = lib.mkDefault true;
  bluetooth.enable = lib.mkDefault true;
  plex.enable = lib.mkDefault true;

  # Unsafe
  qbittorrent.enable = lib.mkDefault false;
}
