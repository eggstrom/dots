{ config, pkgs, ... }:
{
  services = {
    mpd = {
      enable = true;
      musicDirectory = "${config.xdg.userDirs.music}/playlist";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "pipewire"
        }
      '';
    };
  };

  home.packages = with pkgs; [
    mpc
    (pkgs.writeShellScriptBin
    "fzf-mpd" # bash
    ''
      set -euo pipefail

      FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
        --height 50% \
        --layout reverse \

        --cycle \
        --info inline:'- ' \
        --highlight-line \
        --no-scrollbar \

        --preview-window bottom:3 \
        --preview-border top \
        --preview mpc \

        --bind 'load:pos($(mpc current -f %position%))' \
        --bind 'f1:execute-silent(mpc toggle)+refresh-preview' \
        --bind 'f2:execute-silent(mpc repeat)+refresh-preview' \
        --bind 'f3:execute-silent(mpc random)+refresh-preview' \
        --bind 'f4:execute-silent(mpc single)+refresh-preview' \
        --bind 'f5:execute-silent(mpc consume)+refresh-preview'"

      position="$(mpc listall | cat -n | fzf || :)"
      if [[ -n "$position" ]]; then
        mpc -q play "$(echo "$position" | cut -f1)"
      fi
    '')
  ];
}
