{ pkgs, lib, config, ... }:

{
  options = { pass.enable = lib.mkEnableOption "enables pass"; };

  config = lib.mkIf config.pass.enable {
    programs.password-store.enable = true;
  };
}

