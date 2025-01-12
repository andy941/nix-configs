{ pkgs, lib, inputs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  system.stateVersion = "24.05";

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  programs.hyprland.enable = true;
  programs.hyprland.package =
    inputs.hyprland.packages."${pkgs.system}".hyprland;

  # Enable the X11 windowing system for login screen (FIX)
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.andrea = {
    isNormalUser = true;
    description = "Andrea Finocchio";
    extraGroups = [ "networkmanager" "wheel" "input" ];
  };

  qbittorrent.enable = true;
}
