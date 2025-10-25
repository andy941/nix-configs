{ pkgs, lib, config, ... }:

{
  options = { feh.enable = lib.mkEnableOption "enables feh"; };

  config = lib.mkIf config.feh.enable {
    programs.feh = {
      enable = true;
      themes = {
        default = [ "--offset +0+0 --scale-down" ];
      };
    };
  };
}
