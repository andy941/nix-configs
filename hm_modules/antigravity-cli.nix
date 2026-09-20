{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    antigravity-cli.enable = lib.mkEnableOption "enables antigravity-cli";
  };

  config = lib.mkIf config.antigravity-cli.enable {
    # Packages that should be installed to the user profile.
    home.packages = with pkgs; [ antigravity-cli ];
  };
}
