{ pkgs, lib, config, ... }:

{
  options = {
    dataScienceModules.enable = lib.mkEnableOption
      "enables data science modules centered around Quarto and Neovim";
  };

  config = lib.mkIf config.dataScienceModules.enable {

    rBase = {
      enable = lib.mkDefault true;
      rPackages = with pkgs.rPackages; [
        reticulate
        ggplot2
        tidyverse
        ggthemes
        ggpubr
        kableExtra
      ];
    };

    pythonBase = {
      enable = lib.mkDefault true;
      pythonPackages = with pkgs.python3Packages; [ pandas numpy ];
    };

    home.packages = with pkgs; [ quarto ];

    neovim.enable = lib.mkDefault true;
  };
}
