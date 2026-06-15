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

    # To avoid HomeManager from overwriting the neovim config, we symlink the config to a source directory.
    xdg.configFile."nvim".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nvim-src";

    # Setting programs.neovim.enable to false to allow full manual control of nvim config via xdg.configFile.
    programs.neovim.enable = false;

    home.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    home.packages =
      with pkgs;
      [
        unstable.neovim-unwrapped # Ensure neovim itself is installed

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

        # General tools and dependencies
        gcc
        gnumake
        fd
        ripgrep
        lua5_1
        luarocks
        lldb
        tree-sitter
        nodejs
      ]
      ++ (with pkgs.luajitPackages; [ magick ]); # Assuming magick is a luajit package. Adjust if it's a different Lua package.
  };
}
