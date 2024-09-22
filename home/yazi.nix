{ ... }:
{
  programs.yazi = {
    enable = true;
    catppuccin.enable = true;
  };

  xdg.configFile.yazi = {
    source = ../dotfiles/.config/yazi;
    recursive = true;
  };
}
