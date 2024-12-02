{ config, pkgs, unstable, inputs, ... }:

{

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  home.username = "andrea";
  home.homeDirectory = "/home/andrea";

  # sharedModules = [ inputs.self.outputs.homeManagerModules.default ];

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  # Packages that should be installed to the user profile.
  home.packages = [
    # Fonts
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  # Enable configuring fonts
  fonts.fontconfig.enable = true;

  programs.firefox = { enable = true; };

  programs.yazi = { enable = true; };

  programs.neovim = {
    package = unstable.neovim-unwrapped;
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Andrea Finocchio";
    userEmail = "finocchio.andrea94@gmail.com";
  };

  programs.gh.enable = true;

  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono NF";
    font.size = 10;
    shellIntegration = { enableZshIntegration = true; };
    theme = "Catppuccin-Mocha";
  };

  coreUserPkgs.enable = true;
  zsh.enable = true;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

}
