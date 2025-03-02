{ pkgs, lib, config, ... }:

{
  options = { yazi.enable = lib.mkEnableOption "enables yazi"; };

  config = let
    plugins-repo = pkgs.fetchFromGitHub {
      owner = "yazi-rs";
      repo = "plugins";
      rev = "master";
      hash = "sha256-enIt79UvQnKJalBtzSEdUkjNHjNJuKUWC4L6QFb3Ou4=";
    };

  in lib.mkIf config.yazi.enable {
    programs.yazi = {
      enable = true;
      plugins = { mount = "${plugins-repo}/mount.yazi"; };

      keymap = {
        manager.prepend_keymap = [{
          on = "M";
          run = "plugin mount";
        }];
      };

      settings = {
        manager = {
          sort_by = "alphabetical";
          sort_dir_first = true;
          linemode = "size";
        };

        opener = {
          play = [{
            run = ''vlc "$@"'';
            orphan = true;
          }];
          pdf = [{
            run = ''zathura "$@"'';
            orphan = true;
          }];
        };

        open = {
          prepend_rules = [
            {
              name = "*.mp4";
              use = "play";
            }
            {
              name = "*.mkv";
              use = "play";
            }
            {
              name = "*.pdf";
              use = "pdf";
            }
          ];
        };
      };
    };
  };
}
