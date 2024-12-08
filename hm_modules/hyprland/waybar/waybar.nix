{ pkgs, lib, config, ... }: {
  options = { waybar.enable = lib.mkEnableOption "enables waybar"; };

  config = lib.mkIf config.waybar.enable {
    programs.waybar = {
      enable = true;
      systemd.enable = true;
    };
  };
}
