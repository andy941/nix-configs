{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    tmux.enable = lib.mkEnableOption "enables tmux";
  };

  config = lib.mkIf config.tmux.enable {
    programs.tmux = {
      enable = true;
      keyMode = "vi";
      shortcut = "a";
      customPaneNavigationAndResize = true;
      terminal = "xterm-256color";
      extraConfig = ''
        set-option -g status-position top
        set -g xterm-keys on
        set -g allow-passthrough on
        set -s extended-keys on
        set -as terminal-features 'xterm-kitty:extkeys'
        set -as terminal-features 'xterm-256color:extkeys'
      '';
      plugins = with pkgs; [
        tmuxPlugins.cpu
        {
          plugin = tmuxPlugins.resurrect;
          extraConfig = ''
            set -g @resurrect-strategy-nvim 'session'
            set -g @resurrect-capture-pane-contents 'on'
          '';
        }
        {
          plugin = tmuxPlugins.continuum;
          extraConfig = ''
            set -g @continuum-restore 'on'
            set -g @continuum-save-interval '60' # minutes
          '';
        }
      ];
    };
  };
}
