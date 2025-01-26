{ pkgs, lib, config, ... }:

{
  options = { yazi.enable = lib.mkEnableOption "enables yazi"; };

  config = lib.mkIf config.yazi.enable {
    programs.yazi = {
      enable = true;
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
        };

        open = {
          prepend_rules = [{
            name = "*.mkv";
            use = "play";
          }];
        };
      };
    };
  };
}
