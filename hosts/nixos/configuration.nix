{
  pkgs,
  lib,
  config,
  inputs,
  version,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  system.stateVersion = version;

  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-fortisslvpn
        networkmanager-iodine
        networkmanager-l2tp
        networkmanager-openconnect
        networkmanager-openvpn
        networkmanager-vpnc
        networkmanager-sstp
      ];
    };

    # Avoid DNS leaks with Surfshark
    nameservers = [
      "162.252.172.57"
      "149.154.159.92"
    ];
  };

  # Set your time zone.
  time.timeZone = "Europe/London";

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-mocha-mauve";
    package = pkgs.kdePackages.sddm;
    wayland.enable = true;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.andrea = {
    isNormalUser = true;
    description = "Andrea Finocchio";
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
    ];
  };

  security.polkit.enable = true;

  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    settings = {
      default-cache-ttl = 600;
    };
  };

  # Enable system modules
  environment.systemPackages =
    with pkgs;
    [
      hyprpolkitagent
      coreutils-full
      gparted
      killall
      pkg-config
      mlocate
      pcmanfm
      lsof
    ]
    ++ [
      (pkgs.catppuccin-sddm.override {
        flavor = "mocha";
        accent = "mauve";
        font = "JetBrainsMono";
        fontSize = "14";
        background = "${
          ../../wallpapers/stormtrooper-star-wars-black-background-amoled-3840x2160-8296.png
        }";
        loginBackground = true;
      })
    ];

  services.gvfs.enable = true;

  # Local LLM
  services.open-webui.enable = false;

  # Core modules and settings
  nixSettings.enable = true;
  locale.enable = true;

  # Desktop
  grub.enable = true;
  swapFile.enable = true;
  pipewire.enable = true;
  bluetooth.enable = true;

  # Server
  plex.enable = false;
  syncthing.enable = true;

  # Unsafe pkgs
  qbittorrent.enable = true;

  # Unfree pkgs
  discord.enable = true;
}
