{ pkgs, lib, config, ... }:

{
  options = {
    flameshot.enable = lib.mkEnableOption "enables flameshot screenshot tool";
  };

  config = lib.mkIf config.flameshot.enable {
    services.flameshot = {
      enable = true;
      package = pkgs.flameshot.override { enableWlrSupport = true; };
    };
  };
}
