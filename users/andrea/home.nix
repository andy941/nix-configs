{ config, pkgs, unstable, inputs, osConfig, ... }:

{
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  home.username = "andrea";
  home.homeDirectory = "/home/andrea";

}
