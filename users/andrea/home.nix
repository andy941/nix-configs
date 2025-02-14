{ pkgs, version, ... }:

{
  home.stateVersion = version;
  programs.home-manager.enable = true;

  home.username = "andrea";
  home.homeDirectory = "/home/andrea";

  catppuccin = {
    enable = true;
    flavor = "mocha";
    nvim.enable = false;
  };

  # Enable user modules

  # Core
  home.packages = with pkgs; [
    zip
    xz
    unzip
    p7zip
    jq
    which
    tree
    gnupg
    htop
    bottom
    wget
    curl
    xclip
  ];

  # Terminal
  zsh.enable = true;
  neovim.enable = true;
  git.enable = true;
  kitty.enable = true;
  fzf.enable = true;
  fonts.enable = true;
  gh.enable = true;
  yazi.enable = true;
  starship.enable = true;

  # Desktop
  hyprland.enable = true;
  firefox.enable = true;
  vlc.enable = true;
  rofi.enable = true;
  waybar.enable = true;
  dunst.enable = true;
}
