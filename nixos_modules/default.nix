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
}
