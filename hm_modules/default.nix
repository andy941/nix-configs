{ pkgs, lib, config, stable, ... }: {
  imports = [
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
    ./rofi.nix
    ./waybar/waybar.nix
    ./dunst.nix
    ./pass.nix
  ];
}
