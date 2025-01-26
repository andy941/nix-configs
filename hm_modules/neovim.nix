{ pkgs, lib, config, unstable, ... }:

{
  options = { neovim.enable = lib.mkEnableOption "enables neovim"; };

  config = lib.mkIf config.neovim.enable {
    home.packages = with pkgs; [
      fd
      ripgrep
      lua5_1
      luarocks
      nixfmt-classic
      nil
    ];

    programs.neovim = {
      package = unstable.neovim-unwrapped;
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };
  };
}
