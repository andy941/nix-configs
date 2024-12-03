{ pkgs, lib, config, ... }:

{
  options = { fonts.enable = lib.mkEnableOption "enables fonts"; };

  config = lib.mkIf config.fonts.enable {
    # Packages that should be installed to the user profile.
    home.packages = [
      # Fonts
      (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];

    # Enable configuring fonts
    fonts.fontconfig.enable = true;
  };
}
