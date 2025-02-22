{ pkgs, lib, config, ... }:

{
  options = { gtk-theme.enable = lib.mkEnableOption "enables gtk-theme"; };

  config = lib.mkIf config.gtk-theme.enable {
    gtk = {
      enable = true;
      font = {
        name = "JetBrainsMono NF";
        package = pkgs.nerd-fonts.jetbrains-mono;
      };

      theme = {
        name = "Catppuccin-GTK-Dark";
        package = pkgs.magnetic-catppuccin-gtk;
      };

      iconTheme = {
        name = "adwaita";
        package = pkgs.adwaita-icon-theme;
      };

      cursorTheme = {
        name = "adwaita";
        package = pkgs.adwaita-icon-theme;
      };
    };
  };
}
