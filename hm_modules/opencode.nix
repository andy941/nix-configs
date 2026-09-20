{
  stable,
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
      package = stable.opencode;

      settings = {
        # Hard-lock both primary and background/agentic operations to the free endpoint
        model = "openrouter/free";
        small_model = "openrouter/free";
        # model = "openrouter/qwen/qwen3.8-27b:free";
        # small_model = "openrouter/qwen/qwen3.8-27b:free";
      };
    };
  };
}
