{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{

  options = {
    qbittorrent.enable = lib.mkEnableOption "enables qbittorrent";
  };

  config = lib.mkIf config.qbittorrent.enable {
    nixpkgs.config.permittedInsecurePackages = [ "qbittorrent-4.6.4" ];

    environment.systemPackages = with pkgs; [ qbittorrent ];
  };
}
