{ pkgs, lib, config, ... }:

{
  options = { redshift.enable = lib.mkEnableOption "enables redshift"; };

  config = lib.mkIf config.redshift.enable {
    services.redshift = {
      enable = true;
      tray = true;
      dawnTime = "6:00-8:00";
      duskTime = "18:00-20:00";
    };
  };

}
