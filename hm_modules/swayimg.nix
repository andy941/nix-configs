{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    swayimg.enable = lib.mkEnableOption "enables swayimg";
  };

  config = lib.mkIf config.swayimg.enable {
    programs.swayimg = {
      enable = true;
    };
  };
}
