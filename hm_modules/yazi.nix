{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    yazi.enable = lib.mkEnableOption "enables yazi";
  };

  config =
    let
      plugins-repo = pkgs.fetchFromGitHub {
        owner = "yazi-rs";
        repo = "plugins";
        rev = "master";
        hash = "sha256-enIt79UvQnKJalBtzSEdUkjNHjNJuKUWC4L6QFb3Ou4=";
      };

    in
    lib.mkIf config.yazi.enable {
      programs.yazi = {
        enable = true;
        plugins = {
          mount = "${plugins-repo}/mount.yazi";
        };

        keymap = {
          mgr.prepend_keymap = [
            {
              on = "M";
              run = "plugin mount";
            }
          ];
        };

        settings = {
          mgr = {
            sort_by = "alphabetical";
            sort_dir_first = true;
            linemode = "size";
          };

          tasks = {
            image_bound = [
              0
              0
            ];
          };

          opener = {
            play = [
              {
                run = "vlc %s";
                orphan = true;
              }
            ];
            pdf = [
              {
                run = "zathura %s";
                orphan = true;
              }
            ];
          };

          open = {
            prepend_rules = [
              {
                url = "*.mp4";
                use = "play";
              }
              {
                url = "*.mkv";
                use = "play";
              }
              {
                url = "*.pdf";
                use = "pdf";
              }
            ];
          };
        };
      };
    };
}
