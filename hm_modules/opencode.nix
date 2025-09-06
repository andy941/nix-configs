{ pkgs, lib, config, ... }:

{
  options = { opencode.enable = lib.mkEnableOption "enables opencode"; };

  config = lib.mkIf config.opencode.enable {
    programs.opencode = {
      enable = true;
    };
  };
}

