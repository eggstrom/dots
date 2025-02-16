{ lib, pkgs, ... }:
let
  inherit (builtins) attrValues mapAttrs;

  editScrollback = pkgs.writeShellScript "tmux-edit-scrollback" ''
    set -euo pipefail

    file="$(mktemp -t tmux-scrollback.XXXXXX)"
    echo "$(cat)" > "$file" # Command substitution trims trailing \n
    tmux neww "$EDITOR $file +$1; rm $file"
  '';

  binds = {
    # Pane navigation
    Left = "selectp -L";
    Down = "selectp -D";
    Up = "selectp -U";
    Right = "selectp -R";
    h = "selectp -L";
    j = "selectp -D";
    k = "selectp -U";
    l = "selectp -R";
    Space = "run-shell 'tmux last || true'";

    # Pane moving, creation and deletion
    f = "resizep -Z";
    m = "selectp -m";
    s = "run-shell 'tmux joinp || tmux splitw -c \"#{pane_current_path}\"'";
    v = "run-shell 'tmux joinp -h || tmux splitw -hc \"#{pane_current_path}\"'";
    b = "breakp -d";
    q = "killp";

    # Windows
    w = "neww -c '#{pane_current_path}'";
    n = "run-shell 'tmux next || true'";
    p = "run-shell 'tmux prev || true'";
    "1" = "selectw -t :1";
    "2" = "selectw -t :2";
    "3" = "selectw -t :3";
    "4" = "selectw -t :4";
    "5" = "selectw -t :5";
    "6" = "selectw -t :6";
    "7" = "selectw -t :7";
    "8" = "selectw -t :8";
    "9" = "selectw -t :9";
    "0" = "selectw -t :10";

    # Sessions
    r = "command-prompt -p 'Session name:' 'run-shell \"echo %% | tr \\\" \\\" - | xargs tmux rename\"'";
    d = "detach";
    a = "neww fzf-session-manager";

    # Scrollback
    e = "run-shell 'tmux capturep -pS -#{history_limit} | ${editScrollback} #{history_limit}'";
    c = "clearhist";

    # Miscellaneous
    "." = "source ~/.config/tmux/tmux.conf";
    ":" = "command-prompt";
  };

  repeatingBinds = {
    # Pane resizing
    S-Left = "resizep -L";
    S-Down = "resizep -D";
    S-Up = "resizep -U";
    S-Right = "resizep -R";
    H = "resizep -L";
    J = "resizep -D";
    K = "resizep -U";
    L = "resizep -R";
  };

  bindsString =
    binds |> mapAttrs (key: bind: "bind ${key} ${bind}\nbind C-${key} ${bind}") |> attrValues;
  repeatingBindsString =
    repeatingBinds |> mapAttrs (key: bind: "bind -r ${key} ${bind}") |> attrValues;
  bindsConfig = (bindsString ++ repeatingBindsString) |> lib.strings.concatStringsSep "\n";
in
{
  programs.tmux = {
    enable = true;

    terminal = "tmux-256color"; # Enable truecolor
    prefix = "C-Space";
    mouse = true;
    escapeTime = 0; # Disable delay when pressing Escape
    baseIndex = 1; # Start window and pane indexing at 1
    extraConfig =
      ''
        set -g exit-empty off      # Don't kill server if there are no sessions
        set -g repeat-time 32767   # Make time between repeats very long
        set -g renumber-windows on # Make window number depend on position

        set -g status-interval 1
        set -g status-style default

        set -g status-left '#[reverse] 󰀄 #[none] #S '
        set -g status-left-style 'fg=#{?client_prefix,red,green}'
        set -g status-left-length 40

        set -g window-status-format '#[reverse] #I #{?#{>:#{window_panes},1},#[none] #{window_panes} ,}'
        set -g window-status-current-format '#[reverse] #I #{?#{>:#{window_panes},1},#[none] #{window_panes} ,}'
        set -g window-status-separator ""
        set -g window-status-style fg=black
        set -g window-status-current-style fg=blue
        set -g window-status-last-style fg=white

        set -g status-right '#[reverse] 󰞌 #[none] %a %b %Y-%m-%d %T '
        set -g status-right-style fg=yellow

        set -g pane-border-style fg=black
        set -g pane-active-border-style fg=blue
        set -g mode-style bg=black,fg=white
        set -g message-style default
        set -g message-command-style default

        unbind -a
      ''
      + bindsConfig;
  };
}
