{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    kitty.enable = lib.mkEnableOption "enables kitty";
  };

  config = lib.mkIf config.kitty.enable {
    programs.kitty = {
      enable = true;
      font = {
        name = "JetBrainsMono NF";
        package = pkgs.nerd-fonts.jetbrains-mono;
        size = 14;
      };
      shellIntegration = {
        enableZshIntegration = true;
      };
      settings = {
        confirm_os_window_close = 0;
        enable_audio_bell = 0;

        cursor_blink_interval = 0;
        window_margin_width = 0;
        window_border_width = 0; # pt
        single_window_margin_width = 0;
        window_padding_width = 5;
        hide_window_decorations = 0;

        tab_bar_min_tabs = 2;
        tab_bar_edge = "bottom";
        tab_bar_style = "powerline";
        tab_powerline_style = "slanted";
        tab_title_template = "{title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";

        background_opacity = "0.9";
        background_blur = 50;
      };

      keybindings = {
        "alt+t" = "kitten themes --reload=all Catppuccin-Mocha";
        "alt+shift+t" = "kitten themes --reload=all Catppuccin-Latte";
        "cmd+t" = "discard_event";
        "cmd+enter" = "discard_event";
      };
    };
  };

}
