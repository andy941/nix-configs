{ pkgs, lib, config, stable, ... }: {
  imports = [
    ./dataScienceEnv.nix
    ./terminalDevEnv.nix
  ];
}

