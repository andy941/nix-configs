{ config, pkgs, unstable, ... }:

{
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  home.username = "andrea";
  home.homeDirectory = "/home/andrea";

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # Fonts
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  imports = [
    ./hm_common.nix
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

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    plugins = with pkgs; [{
      name = "zsh-syntax-highlighting";
      src = fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-syntax-highlighting";
        rev = "0.6.0";
        sha256 = "0zmq66dzasmr5pwribyh4kbkk23jxbpdw4rjxx0i7dx8jjp2lzl4";
      };
      file = "zsh-syntax-highlighting.zsh";
    }];
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

}
