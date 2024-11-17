{ config, pkgs, unstable, ... }:

{
  home.username = "andrea";
  home.homeDirectory = "/home/andrea";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [

    # Interpreters
    nodejs
    python3
    R
    lua5_1
    luarocks

    neofetch
    yazi # terminal file manager

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    fd # recursively searches files in directories
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor

    # networking tools
    which
    tree
    gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    htop # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # Fonts
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

    # Formatters
    nixfmt-classic

    # LSPs
    nil
  ];

  # Enable configuring fonts
  fonts.fontconfig.enable = true;

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

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
