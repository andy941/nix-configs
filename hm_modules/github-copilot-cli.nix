{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    github-copilot-cli.enable = lib.mkEnableOption "enables github-copilot-cli";
  };

  config = lib.mkIf config.github-copilot-cli.enable {
    # Packages that should be installed to the user profile.
    home.packages = with pkgs; [ github-copilot-cli ];
  };
}
