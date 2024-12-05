{ pkgs, lib, osCOnfig, ... }: {
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
    ./firefox.nix
    ./vlc.nix
    ./hyprland.nix
  ];

  coreUserPkgs.enable = lib.mkDefault true;
  zsh.enable = lib.mkDefault true;
  neovim.enable = lib.mkDefault true;
  git.enable = lib.mkDefault true;
  kitty.enable = lib.mkDefault true;
  fzf.enable = lib.mkDefault true;
  fonts.enable = lib.mkDefault true;
  gh.enable = lib.mkDefault true;
  yazi.enable = lib.mkDefault true;

  hyprland.enable = lib.mkDefault false;
  firefox.enable = lib.mkDefault true;
  vlc.enable = lib.mkDefault true;
}
