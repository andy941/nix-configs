{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    opencode.enable = lib.mkEnableOption "enables opencode";
  };

  config = lib.mkIf config.opencode.enable {
    programs.opencode = {
      enable = true;

      # Declarative setting mapping to ~/.config/opencode/opencode.json
      settings = {
        # Hard-lock both primary and background/agentic operations to the free endpoint
        model = "openrouter/free";
        small_model = "openrouter/free";
      };
    };
  };
}
