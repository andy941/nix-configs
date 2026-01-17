{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    nixSettings.enable = lib.mkEnableOption "enables nixosSettings";
  };

  config = lib.mkIf config.nixSettings.enable {
    nix = {
      settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      # Perform garbage collection weekly to maintain low disk usage
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 1w";
      };
      settings.auto-optimise-store = true;
    };

    nixpkgs.config.allowUnfree = true;
  };

}
