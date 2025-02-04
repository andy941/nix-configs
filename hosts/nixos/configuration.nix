{ pkgs, lib, inputs, version, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  system.stateVersion = version;

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;

    # Avoid DNS leaks with Surfshark
    nameservers = [ "162.252.172.57" "149.154.159.92" ];
  };

  # Set your time zone.
  time.timeZone = "Europe/London";

  programs.hyprland.enable = true;
  programs.hyprland.package =
    inputs.hyprland.packages."${pkgs.system}".hyprland;

  # Enable the X11 windowing system for login screen (FIX)
  services.xserver.enable = true;
  environment.systemPackages = [
    (pkgs.catppuccin-sddm.override {
      flavor = "mocha";
      font = "JetBrainsMono";
      fontSize = "14";
      background =
        "${../../wallpapers/stormtrooper-star-wars-black-background-amoled-3840x2160-8296.png}";
      loginBackground = true;
    })
  ];

  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-mocha";
    package = pkgs.kdePackages.sddm;
  };

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
