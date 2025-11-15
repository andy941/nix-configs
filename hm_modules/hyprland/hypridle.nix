{ pkgs, lib, config, ... }:

{
  options = { hypridle.enable = lib.mkEnableOption "enables hypridle"; };

  config = lib.mkIf config.hypridle.enable {
    services.hypridle = {
      enable = true;

      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          unlock_cmd = "notify-send 'unlock!'";
          
          inhibit_sleep = 1;
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "sleep 2 && hyprctl dispatch dpms on";
        };

        listener = [
          {
            timeout = 900;
            on-timeout = "loginctl lock-session";
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
