{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    gemini-cli.enable = lib.mkEnableOption "enables gemini-cli";
  };

  config = lib.mkIf config.gemini-cli.enable {
    # Packages that should be installed to the user profile.
    home.packages = with pkgs; [ gemini-cli ];
  };
}
