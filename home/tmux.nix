{ lib, pkgs, ... }:
let
  inherit (builtins) attrValues mapAttrs;

  sessionManager = pkgs.writeShellScript "tmux-session-manager" ''
    set -euo pipefail

    NAME='echo {} | cut -d: -f1'
    PREVIEW="tmux capturep -pet \"\$($NAME)\""
    KILL="tmux kill-session -t \"\$($NAME)\""
    LIST="tmux ls | sed -e '/(attached)\$/ s/^/$(tput setaf 2)/' \
                        -e '/(attached)\$/! s/^/$(tput setaf 3)/'"

    eval "$LIST" | fzf --ansi \
      --bind "ctrl-r:reload($LIST)" \
      --bind "ctrl-q:execute($KILL)+reload($LIST)" \
      --preview "$PREVIEW" \
      | cut -d: -f1 | xargs tmux switchc -t 2>/dev/null || true
  '';

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
    a = "neww ${sessionManager}";

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
        unbind -a
      ''
      + bindsConfig;

    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = catppuccin;
        extraConfig = "set -g @catppuccin_status_left_separator '█'";
      }
    ];
  };
}
