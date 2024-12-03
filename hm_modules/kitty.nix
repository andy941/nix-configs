{ pkgs, lib, config, ... }:

{
  options = { kitty.enable = lib.mkEnableOption "enables kitty"; };

  config = lib.mkIf config.kitty.enable {
    programs.kitty = {
      enable = true;
      font.name = "JetBrainsMono NF";
      font.size = 10;
      shellIntegration = { enableZshIntegration = true; };
      theme = "Catppuccin-Mocha";
    };
  };

}
