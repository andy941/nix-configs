{ pkgs, lib, ... }: {
  imports = [
    ./nixSettings.nix
    ./grub.nix
    ./swapFile.nix
    ./locale.nix
    ./pipewire.nix
    ./bluetooth.nix
    ./qbittorrent.nix
    ./plex.nix
    ./syncthing.nix
    ./discord.nix
  ];
}
