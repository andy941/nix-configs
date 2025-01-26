{ pkgs, lib, config, ... }:

{
  options = { corePkgs.enable = lib.mkEnableOption "enables corePkgs"; };

  config = lib.mkIf config.corePkgs.enable {
    environment.systemPackages = with pkgs; [
      git
      wget
      curl
      llvm
      gcc
      clang
      gnumake
      cmake
      coreutils-full
      gparted
      xclip
      killall
      pkg-config
      mlocate
    ];
  };
}
