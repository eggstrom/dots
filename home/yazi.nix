{ pkgs, ... }:
let
  setbg = pkgs.writeShellScriptBin "setbg" ''
    set -euo pipefail

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

    keymap.manager.prepend_keymap = [
      # Keymaps for going to directories
      { on = [ "g" "D" ]; run = "cd ~/Downloads"; desc = "Goto ~/Downloads"; }
      { on = [ "g" "d" ]; run = "cd ~/Documents"; desc = "Goto ~/Documents"; }
      { on = [ "g" "p" ]; run = "cd ~/Pictures"; desc = "Goto ~/Pictures"; }
      { on = [ "g" "m" ]; run = "cd ~/Music"; desc = "Goto ~/Music"; }
      { on = [ "g" "v" ]; run = "cd ~/Videos"; desc = "Goto ~/Videos"; }
      { on = [ "g" "C" ]; run = "cd ~/.config"; desc = "Goto ~/.config"; }
      { on = [ "g" "c" ]; run = "cd ~/.cache"; desc = "Goto ~/.cache"; }
      { on = [ "g" "l" ]; run = "cd ~/.local"; desc = "Goto ~/.local"; }
      { on = [ "g" "n" ]; run = "cd ~/.nix"; desc = "Goto ~/.nix"; }
      { on = [ "g" "r" ]; run = "cd /"; desc = "Goto /"; }
      { on = [ "g" "M" ]; run = "cd /run/media"; desc = "Goto /run/media"; }

      # Keymap for setting the background
      { on = [ "b" ]; run = "shell --confirm '${setbg}/bin/setbg \"$0\" || true'"; desc = "Set background"; }
    ];
  };

  catppuccin.yazi.enable = true;
}
