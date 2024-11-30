{ config, pkgs, ... }:

{
  config = {
    # Packages that should be installed to the user profile.
    home.packages = with pkgs; [
      nodejs
      python3
      R
      lua5_1
      luarocks
      zip
      xz
      unzip
      p7zip
      fd
      ripgrep
      jq
      which
      tree
      gnupg
      htop
      nixfmt-classic
      nil
    ];
  };
}
