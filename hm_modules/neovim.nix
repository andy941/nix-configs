{ pkgs, lib, config, unstable, ... }:

{
  options = { neovim.enable = lib.mkEnableOption "enables neovim"; };

  config = lib.mkIf config.neovim.enable {
    programs.neovim = {
      package = unstable.neovim-unwrapped;
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraLuaPackages = luaPkgs: with luaPkgs; [ magick ];
      extraPackages = with pkgs; [
        fd
        ripgrep
        lua5_1
        luarocks
        nixfmt-classic
        nil
        stylua
        pyright
        cbfmt
        lua-language-server
        marksman
        clang-tools
        cmake-language-server
        rustfmt
        rust-analyzer
      ];
    };
  };
}
