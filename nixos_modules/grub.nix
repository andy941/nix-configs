{ pkgs, lib, config, ... }:

{
  options = { grub.enable = lib.mkEnableOption "enables GRUB configuration"; };

  config = lib.mkIf config.grub.enable {
    boot.loader = {
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
      grub.enable = true;
      grub.devices = [ "nodev" ];
      grub.efiSupport = true;
      grub.useOSProber = true;
      grub.configurationLimit = 10;
    };
  };

}
