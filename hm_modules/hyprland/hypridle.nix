{ pkgs, lib, config, ... }:

{
  options = { hypridle.enable = lib.mkEnableOption "enables hypridle"; };

  config = lib.mkIf config.hypridle.enable {
    services.hypridle = {
      enable = true;

      settings = {
        general = {
          lock_cmd = "hyprlock";

          inhibit_sleep = 1;
          before_sleep_cmd = "hyprlock";
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };

        listener = [
          {
            timeout = 900;
            on-timeout = "hyprlock";
          }
          {
            timeout = 1200;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
          # {
          #   timeout = 1800;
          #   on-timeout = "systemctl suspend";
          # }
        ];
      };
    };
  };
}
