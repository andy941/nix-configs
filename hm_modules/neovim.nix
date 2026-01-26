{
  pkgs,
  lib,
  config,
  unstable,
  ...
}:

{
  options = {
    neovim.enable = lib.mkEnableOption "enables neovim";
  };

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
        gcc
        gnumake
        fd
        ripgrep
        lua5_1
        luarocks
        lldb
        tree-sitter
        nodejs

        # LSPs
        rust-analyzer
        wgsl-analyzer
        cmake-language-server
        clang-tools
        lua-language-server
        pyright
        marksman
        nil

        # snacks.image
        imagemagick
        ghostscript
        tectonic
        mermaid-cli

        # formatters
        black
        yapf
        rustfmt
        nixfmt
        stylua
        cbfmt
      ];
    };
  };
}
