{ pkgs, lib, ... }: {
  imports = [
    ./nixSettings.nix
    ./grub.nix
    ./swapFile.nix
    ./locale.nix
    ./corePkgs.nix
    ./pipewire.nix
  ];

  corePkgs.enable = lib.mkDefault true;
  grub.enable = lib.mkDefault true;
  nixSettings.enable = lib.mkDefault true;
  locale.enable = lib.mkDefault true;

  swapFile.enable = lib.mkDefault true;
  pipewire.enable = lib.mkDefault true;
}
