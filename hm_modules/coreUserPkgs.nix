{ pkgs, lib, config, ... }:

{
  options = {
    coreUserPkgs.enable = lib.mkEnableOption "enables coreUserPkgs";
  };

  config = lib.mkIf config.coreUserPkgs.enable {
    # Packages that should be installed to the user profile.
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
      nodejs
      (python3.withPackages (ps: with ps; [ pandas regex ]))
      quarto
      zathura
      stylua
      pyright
      cbfmt
      lua-language-server
      marksman
      clang-tools
      (rWrapper.override {
        packages = with rPackages; [ languageserver reticulate ggplot2 ];
      })
    ];
  };
}
