{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    plex.enable = lib.mkEnableOption "enables plex";
  };

  config = lib.mkIf config.plex.enable {
    services.plex = {
      enable = true;
      openFirewall = true;
      user = "andrea";
    };
  };
}
