{
  pkgs,
  lib,
  config,
  ...
}:

{
  imports = [
    ./hyprpaper/hyprpaper.nix
    ./hyprlock.nix
    ./hypridle.nix
  ];

  options = {
    hyprland.enable = lib.mkEnableOption "enables hyprland";
  };

  config = lib.mkIf config.hyprland.enable {

    waybar.enable = lib.mkDefault true;
    rofi.enable = lib.mkDefault true;
    hyprpaper.enable = lib.mkDefault true;
    hyprlock.enable = lib.mkDefault true;
    hypridle.enable = lib.mkDefault true;
    dunst.enable = lib.mkDefault true;

    home.packages = with pkgs; [
      brightnessctl
      zathura
      adwaita-icon-theme
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;

      configType = "lua";

      extraLuaFiles = {
        "config" = {
          content = ./hyprland.lua;
          autoLoad = true;
        };
      };

      systemd.variables = [ "--all" ];
    };
  };
}
