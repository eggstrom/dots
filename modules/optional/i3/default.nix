{ pkgs, ... }:
{
  home.packages = with pkgs; [
    i3
    i3lock
    maim
    xclip
  ];

  xdg.configFile = {
    i3 = {
      source = ./home/.config/i3;
      recursive = true;
    };
    xinitrc.source = ./home/.config/xinitrc;
  };

  # Configure compositor
  services.picom = {
    enable = true;
    vSync = true;
    backend = "glx";
    settings = {
      # Recommended by man page
      glx-no-stencil = true;
      # Only redraw parts that change, may cause artifacts
      use-damage = true;
    };
  };
}
