{ pkgs, lib, config, ... }:

{
  options = {
    dataScienceModules.enable = lib.mkEnableOption
      "enables data science modules centered around Quarto and Neovim";
  };

  config = lib.mkIf config.dataScienceModules.enable {
    home.packages = with pkgs; [
      quarto
      (python3.withPackages (ps: with ps; [ numpy pandas ]))
      (rWrapper.override {
        packages = with rPackages; [
          lintr
          languageserver
          reticulate
          ggplot2
          tidyverse
          ggthemes
          ggpubr
          kableExtra
        ];
      })
    ];
    neovim.enable = lib.mkDefault true;
  };
}
