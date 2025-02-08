{ pkgs, lib, config, stable, ... }: {
  imports = [
    ./coreUserPkgs.nix
    ./zsh.nix
    ./neovim.nix
    ./git.nix
    ./kitty.nix
    ./fzf.nix
    ./fonts.nix
    ./gh.nix
    ./yazi.nix
    ./starship.nix
    ./hyprland
    ./firefox.nix
    ./vlc.nix
  ];
}
