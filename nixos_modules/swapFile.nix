{ pkgs, lib, config, ... }:

{
  options = { swapFile.enable = lib.mkEnableOption "enables swapFile"; };

  config = lib.mkIf config.swapFile.enable {
    swapDevices = [{
      device = "/swapfile";
      size = 8 * 1024;
    }];
  };

}
