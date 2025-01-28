{ pkgs, lib, config, ... }:

{
  options = { hyprlock.enable = lib.mkEnableOption "enables hyprlock"; };

  config = lib.mkIf config.hyprlock.enable {
    programs.hyprlock = {
      enable = true;
      settings = {
        background = {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 7;
          brightness = 0.8;
          contrast = 0.8;
        };

        input-field = {
          size = "400, 100";
          outline_thickness = 3;
          dots_size = 0.2;
          dots_spacing = 0.15;
          dots_center = true;
          fade_on_empty = false;
          hide_input = false;
          position = "0, -300";
          halign = "center";
          valign = "center";
        };

        label = {
          text = "$TIME";
          font_family = "JetBrains Mono Extrabold";
          font_size = 400;
          position = "0, 0";
          halign = "center";
          valign = "center";
        };
      };
    };
  };
}
