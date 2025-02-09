{ pkgs, lib, config, ... }:

{
  options = {
    rBase.enable = lib.mkEnableOption "enables R";
    rBase.rPackages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [ ];
      description = "List of R packages to be installed.";
    };
  };

  config = lib.mkIf config.rBase.enable {
    home.packages = [ (pkgs.rWrapper.override { packages = config.rBase.rPackages; }) ];
  };
}
