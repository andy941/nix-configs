{ pkgs, lib, config, ... }:

{
  options = {
    terminalDevEnv.enable = lib.mkEnableOption
      "enables modules for a terminal-based development environment with Neovim as an IDE";
  };

  config = lib.mkIf config.terminalDevEnv.enable {

    rBase = {
      enable = lib.mkDefault true;
      rPackages = with pkgs.rPackages; [ lintr languageserver ];
    };

    pythonBase = {
      enable = lib.mkDefault true;
      pythonPackages = with pkgs.python3Packages; [ ];
    };

    yazi.enable = lib.mkDefault true;
    zsh.enable = lib.mkDefault true;
    kitty.enable = lib.mkDefault true;
    fonts.enable = lib.mkDefault true;
    neovim.enable = lib.mkDefault true;
    git.enable = lib.mkDefault true;
    gh.enable = lib.mkDefault true;
    fzf.enable = lib.mkDefault true;
    starship.enable = lib.mkDefault true;
  };
}
