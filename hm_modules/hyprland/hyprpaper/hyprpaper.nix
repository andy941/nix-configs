{ pkgs, lib, config, ... }:

{
  options = { hyprpaper.enable = lib.mkEnableOption "enables hyprpaper"; };

  config = lib.mkIf config.hyprpaper.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
        preload =
          "${../../../wallpapers/stormtrooper-star-wars-black-background-amoled-3840x2160-8296.png}";
        wallpaper =
          ",${../../../wallpapers/stormtrooper-star-wars-black-background-amoled-3840x2160-8296.png}";
      };
    };
  };
}
