{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    llm-local.enable = lib.mkEnableOption "enables llm setup with ollama and open-webui";
  };

  config = lib.mkIf config.llm-local.enable {
    services.ollama = {
      enable = true;
    };
  };
}
