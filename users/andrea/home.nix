{ version, ... }:

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
  coreUserPkgs.enable = true;

  # Terminal
  zsh.enable = true;
  kitty.enable = true;
  fonts.enable = true;
  neovim.enable = true;
  git.enable = true;
  gh.enable = true;
  fzf.enable = true;
  yazi.enable = true;
  starship.enable = true;

  # Desktop
  hyprland.enable = true;
  firefox.enable = true;
  vlc.enable = true;
}
