{ pkgs, lib, config, osConfig, ... }:

{
  options = { zsh.enable = lib.mkEnableOption "enables zsh configuration"; };

  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      historySubstringSearch.enable = true;
      syntaxHighlighting.enable = true;

      oh-my-zsh = {
        enable = true;
        plugins = [ "git-auto-fetch" "gh" "sudo" "colorize" "vi-mode" ];
      };

      # plugins = with pkgs; [{
      #   name = "zsh-syntax-highlighting";
      #   src = fetchFromGitHub {
      #     owner = "zsh-users";
      #     repo = "zsh-syntax-highlighting";
      #     rev = "0.6.0";
      #     sha256 = "0zmq66dzasmr5pwribyh4kbkk23jxbpdw4rjxx0i7dx8jjp2lzl4";
      #   };
      #   file = "zsh-syntax-highlighting.zsh";
      # }];

      shellAliases = { l = "ls -lah"; };

      initExtra =
        # File browser Yazi, when closing it changes directory (use `Q` if don't want to)
        ''
          function ff() {
            local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
            yazi "$@" --cwd-file="$tmp"
            if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
              builtin cd -- "$cwd"
            fi
            rm -f -- "$tmp"
          }
        '';
    };
  };
}
