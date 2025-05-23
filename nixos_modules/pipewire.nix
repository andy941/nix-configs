{ pkgs, lib, config, ... }:

{
  options = { pipewire.enable = lib.mkEnableOption "enables pipewire"; };

  config = lib.mkIf config.pipewire.enable {
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
