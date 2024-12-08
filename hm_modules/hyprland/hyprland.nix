{ pkgs, lib, config, ... }:

{
  imports = [ ./redshift.nix ./waybar/waybar.nix ];

  options = { hyprland.enable = lib.mkEnableOption "enables hyprland"; };

  config = lib.mkIf config.hyprland.enable {

    services.blueman-applet.enable = true; # FIX: NOT WORKING??
    services.network-manager-applet.enable = true;

    redshift.enable = lib.mkDefault true;
    waybar.enable = lib.mkDefault true;

    # home.packages = with pkgs; [];

    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;

      settings = {
        # exec-once = [ ];

        monitor = [
          "eDP-1,highres@highrr,0x0,1,bitdepth,10"
          "DP-3,highres@highrr,auto-up,1.5,bitdepth,10"
          ",highres@highrr,auto-left,1,bitdepth,10"
        ];

        workspace = [
          "1,monitor:DP-3,default:true"
          "2,monitor:DP-3"
          "3,monitor:DP-3"
          "4,monitor:DP-3"
          "5,monitor:DP-3"
          "6,monitor:DP-3"

          "7,monitor:eDP-1,default:true"
          "8,monitor:eDP-1"
          "9,monitor:eDP-1"
          "10,monitor:eDP-1"
        ];

        "$mod" = "SUPER";

        general = { border_size = 3; };

        decoration = {
          rounding = 5;
          drop_shadow = true;
          shadow_range = 4;
          shadow_render_power = 3;
          blur = {
            enabled = true;
            size = 5;
            passes = 3;
            new_optimizations = "on";
            ignore_opacity = "off";
          };

        };

        bind = [
          "$mod,RETURN,exec,kitty"

          "$mod,F,fullscreen,"

          "$mod}SHIFT,h,movewindow,l"
          "$mod}SHIFT,l,movewindow,r"
          "$mod}SHIFT,k,movewindow,u"
          "$mod}SHIFT,j,movewindow,d"

          "$mod,h,movefocus,l"
          "$mod,l,movefocus,r"
          "$mod,k,movefocus,u"
          "$mod,j,movefocus,d"
          "$mod,1,workspace,1"
          "$mod,2,workspace,2"
          "$mod,3,workspace,3"
          "$mod,4,workspace,4"
          "$mod,5,workspace,5"
          "$mod,6,workspace,6"
          "$mod,7,workspace,7"
          "$mod,8,workspace,8"
          "$mod,9,workspace,9"
          "$mod,0,workspace,10"

          "$mod SHIFT,1,movetoworkspace,1"
          "$mod SHIFT,2,movetoworkspace,2"
          "$mod SHIFT,3,movetoworkspace,3"
          "$mod SHIFT,4,movetoworkspace,4"
          "$mod SHIFT,5,movetoworkspace,5"
          "$mod SHIFT,6,movetoworkspace,6"
          "$mod SHIFT,7,movetoworkspace,7"
          "$mod SHIFT,8,movetoworkspace,8"
          "$mod SHIFT,9,movetoworkspace,9"
          "$mod SHIFT,0,movetoworkspace,10"

          "$mod,q,killactive,"

        ];
      };

      extraConfig = lib.concatStrings [''
        # window resize
        bind = $mod, r, submap, resize

        submap = resize
        binde = , l, resizeactive, 10 0
        binde = , h, resizeactive, -10 0
        binde = , k, resizeactive, 0 -10
        binde = , j, resizeactive, 0 10
        bind = , escape, submap, reset
        submap = reset
      ''];
    };
  };
}
