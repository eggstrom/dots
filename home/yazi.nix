{
  programs.yazi = {
    enable = true;
    settings.manager.show_hidden = true;

    keymap.manager.append_keymap = [
      # Keymaps for going to directories
      { on = [ "g" "D" ]; run = "cd ~/Downloads"; desc = "Go to the downloads directory"; }
      { on = [ "g" "d" ]; run = "cd ~/Documents"; desc = "Go to the documents directory"; }
      { on = [ "g" "p" ]; run = "cd ~/Pictures";  desc = "Go to the pictures directory"; }
      { on = [ "g" "m" ]; run = "cd ~/Music";     desc = "Go to the music directory"; }
      { on = [ "g" "v" ]; run = "cd ~/Videos";    desc = "Go to the videos directory"; }
      { on = [ "g" "C" ]; run = "cd ~/.config";   desc = "Go to the config directory"; }
      { on = [ "g" "c" ]; run = "cd ~/.cache";    desc = "Go to the cache directory"; }
      { on = [ "g" "l" ]; run = "cd ~/.local";    desc = "Go to the local directory"; }
      { on = [ "g" "n" ]; run = "cd ~/.nix";      desc = "Go to the nix directory"; }
      { on = [ "g" "r" ]; run = "cd /";           desc = "Go to the root directory"; }
      { on = [ "g" "M" ]; run = "cd /run/media";  desc = "Go to the media directory"; }

      # Keymaps for setting the background
      { on = [ "b" "g" ]; run = "shell --confirm 'swww img \"$0\" --transition-type none --filter Nearest || true'"; desc = "Set background"; }
      { on = [ "b" "f" ]; run = "shell --confirm 'swww img \"$0\" --transition-type none || true'";                  desc = "Set filtered background"; }
    ];

    catppuccin.enable = true;
  };
}
