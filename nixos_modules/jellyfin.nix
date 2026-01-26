{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    jellyfin.enable = lib.mkEnableOption "enables jellyfin";
  };

  config = lib.mkIf config.jellyfin.enable {
    services.jellyfin = {
      enable = true;
      openFirewall = true;
      user = "andrea";
    };
  };
}
