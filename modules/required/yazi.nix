{ pkgs, ... }:
let
  setbg = pkgs.writeShellScriptBin "setbg" ''
    set -e

    [[ -n "$1" ]] &&
      magick "$1" -scale "$(${pkgs.xorg.xwininfo}/bin/xwininfo -root | grep -oP '(?<=-geometry )\d+x\d+')" ~/Pictures/background.png
    [[ -e ~/Pictures/background.png ]] &&
      feh --no-fehbg --bg-fill --force-aliasing ~/Pictures/background.png
  '';
in
{
  home.packages = [ setbg ];

  programs.yazi = {
    enable = true;
    settings.manager.show_hidden = true;

    keymap.manager.append_keymap = [
      # Keymaps for going to directories
      { on = [ "g" "D" ]; run = "cd ~/Downloads"; desc = "Go to the downloads directory"; }
      { on = [ "g" "d" ]; run = "cd ~/Documents"; desc = "Go to the documents directory"; }
      { on = [ "g" "p" ]; run = "cd ~/Pictures"; desc = "Go to the pictures directory"; }
      { on = [ "g" "m" ]; run = "cd ~/Music"; desc = "Go to the music directory"; }
      { on = [ "g" "v" ]; run = "cd ~/Videos"; desc = "Go to the videos directory"; }
      { on = [ "g" "C" ]; run = "cd ~/.config"; desc = "Go to the config directory"; }
      { on = [ "g" "c" ]; run = "cd ~/.cache"; desc = "Go to the cache directory"; }
      { on = [ "g" "l" ]; run = "cd ~/.local"; desc = "Go to the local directory"; }
      { on = [ "g" "n" ]; run = "cd ~/.nix"; desc = "Go to the nix directory"; }
      { on = [ "g" "r" ]; run = "cd /"; desc = "Go to the root directory"; }
      { on = [ "g" "M" ]; run = "cd /run/media"; desc = "Go to the media directory"; }

      # Keymap for setting the background
      { on = [ "b" ]; run = "shell --confirm '${setbg}/bin/setbg \"$0\" || true'"; desc = "Set background"; }
    ];
  };

  catppuccin.yazi.enable = true;
}
