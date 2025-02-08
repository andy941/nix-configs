{ version, ... }:

{
  home.stateVersion = version;
  programs.home-manager.enable = true;

  home.username = "andrea";
  home.homeDirectory = "/home/andrea";

  catppuccin = {
    enable = true;
    flavor = "mocha";
    nvim.enable = false;
  };

  # Enable user modules

  # Core
  coreUserPkgs.enable = true;

  terminalDevEnv.enable = true;
  dataScienceModules.enable = true;

  # Desktop environment
  hyprland.enable = true;
  firefox.enable = true;
  vlc.enable = true;
}
