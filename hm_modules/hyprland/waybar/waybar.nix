{ pkgs, lib, config, ... }:

{
  options = { waybar.enable = lib.mkEnableOption "enables waybar"; };

  config = lib.mkIf config.waybar.enable {

    home.packages = with pkgs; [ pavucontrol playerctl wlogout ];

    services.network-manager-applet.enable = true;
    services.blueman-applet.enable = true;

    wayland.windowManager.hyprland.settings = {
      exec-once =
        [ "sleep 10; blueman-tray" ]; # FIX: why is this even needed ...
    };

    catppuccin.waybar.enable = false;

    programs.waybar = {
      enable = true;
      systemd.enable = true;
      style = builtins.readFile ./style.css;

      settings = [{
        layer = "top";
        position = "top";

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "custom/music" ];
        modules-right =
          [ "pulseaudio" "backlight" "battery" "clock" "tray" "custom/power" ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          sort-by-name = true;
          format = " {icon} ";
          format-icons = { default = " "; };
        };

        tray = {
          icon-size = 21;
          spacing = 10;
        };

        "custom/music" = {
          format = "  {}";
          escape = true;
          interval = 5;
          tooltip = false;
          exec = "playerctl metadata --format='{{ title }}'";
          on-click = "playerctl play-pause";
          max-length = 50;
        };
        "clock" = {
          timezone = "Europe/London";
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
          format-alt = "{:%d/%m/%Y}";
          format = "{:%H:%M}";
        };
        backlight = {
          device = "intel_backlight";
          format = "{icon}";
          format-icons = [ " " " " " " " " " " " " " " " " " " ];
        };
        "battery" = {
          "states" = {
            warning = 30;
            critical = 1;
          };
          format = "{icon}";
          format-charging = "";
          format-plugged = "";
          format-alt = "{icon}";
          format-icons = [ "" "" "" "" "" "" "" "" "" "" "" "" ];
        };
        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = " ";
          format-icons = { default = [ "" " " " " ]; };
          on-click = "pavucontrol";
        };
        "custom/power" = {
          tooltip = false;
          on-click = "wlogout &";
          format = " ";
        };
      }];
    };
  };
}
