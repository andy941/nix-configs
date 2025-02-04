{ pkgs, lib, config, ... }:

{
  imports = [
    ./redshift.nix
    ./waybar/waybar.nix
    ./rofi/rofi.nix
    ./hyprpaper/hyprpaper.nix
    ./hyprlock.nix
    ./hypridle.nix
  ];

  options = { hyprland.enable = lib.mkEnableOption "enables hyprland"; };

  config = lib.mkIf config.hyprland.enable {

    waybar.enable = lib.mkDefault true;
    redshift.enable = lib.mkDefault false;
    rofi.enable = lib.mkDefault true;
    hyprpaper.enable = lib.mkDefault true;
    hyprlock.enable = lib.mkDefault true;
    hypridle.enable = lib.mkDefault true;

    home.packages = with pkgs; [ brightnessctl ];

    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd.variables = [ "--all" ];

      settings = {
        exec-once = [ "hyprpaper" ];

        monitor = [
          "eDP-1,highres@highrr,0x0,1,bitdepth,10"
          "desc:Samsung Electric Company U32J59x HNMW300479,highres@highrr,auto-up,1,bitdepth,10"
          ",highres@highrr,auto-left,1,bitdepth,10"
        ];

        workspace = [
          "1,monitor:desc:Samsung Electric Company U32J59x HNMW300479,persistent:false,default:true"
          "2,monitor:desc:Samsung Electric Company U32J59x HNMW300479,persistent:false"
          "3,monitor:desc:Samsung Electric Company U32J59x HNMW300479,persistent:false"
          "4,monitor:desc:Samsung Electric Company U32J59x HNMW300479,persistent:false"
          "5,monitor:desc:Samsung Electric Company U32J59x HNMW300479,persistent:false"
          "6,monitor:desc:Samsung Electric Company U32J59x HNMW300479,persistent:false"

          "7,monitor:eDP-1,persistent:false,default:true"
          "8,monitor:eDP-1,persistent:false"
          "9,monitor:eDP-1,persistent:false"
          "0,monitor:eDP-1,persistent:false"
        ];

        "$mod" = "SUPER";

        general = {
          border_size = 3;
          resize_on_border = true;
          no_focus_fallback = true;
          snap.enabled = true;
        };

        decoration = {
          rounding = 5;
          blur = {
            enabled = true;
            size = 5;
            passes = 3;
            new_optimizations = "on";
            ignore_opacity = "off";
          };
        };

        input = {
          repeat_rate = 25;
          repeat_delay = 500;
        };

        windowrule = [
          "float,Rofi"
          "float,.blueman-manager-wrapped"
          "float,org.pulseaudio.pavucontrol"
          "float,nm-connection-editor"
        ];

        bind = [
          "$mod,RETURN,exec,kitty"

          "$mod,d,exec,rofi -show drun"
          "$mod SHIFT,d,exec,rofi -show run"
          "$mod,p,exec,rofi-pass"

          "$mod,F,fullscreen,"

          "$mod SHIFT,h,movewindow,l"
          "$mod SHIFT,l,movewindow,r"
          "$mod SHIFT,k,movewindow,u"
          "$mod SHIFT,j,movewindow,d"

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

          ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
          ",XF86MonBrightnessUp, exec, brightnessctl s +10%"
        ];

        bindel = [
          ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
          ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ];
        bindl = [
          ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioPrev, exec, playerctl previous"
          ", XF86AudioNext, exec, playerctl next"
        ];

        bindm = [ "$mod, mouse:272, movewindow" ];
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
