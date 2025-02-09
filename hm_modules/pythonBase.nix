{ pkgs, lib, config, ... }:

{
  options = {
    pythonBase.enable = lib.mkEnableOption "enables pythonBase";
    pythonBase.pythonPackages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [ ];
      description = "List of pythonBase packages to be installed.";
    };
  };

  config = lib.mkIf config.pythonBase.enable {
    home.packages =
      [ (pkgs.python3.withPackages (ps: config.pythonBase.pythonPackages)) ];
  };
}
