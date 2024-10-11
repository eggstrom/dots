{ config, pkgs, ... }:
{
  catppuccin = {
    accent = "red";
    pointerCursor = {
      enable = true;
      accent = "dark";
    };
  };

  home = {
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      font-awesome
    ];

    pointerCursor = {
      size = 48;
      gtk.enable = true;
    };
  };

  gtk = {
    enable = true;
    theme = {
      package = (
        pkgs.catppuccin-gtk.override {
          variant = "mocha";
          accents = [ "red" ];
        }
      );
      name = "catppuccin-mocha-red-standard";
    };

    # ~/.gtkrc-2.0 -> ~/.config/gtkrc-2.0
    gtk2.configLocation = "${config.xdg.configHome}/gtkrc-2.0";
  };

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style = {
      name = "kvantum";
      catppuccin.enable = true;
      catppuccin.apply = true;
    };
  };
}
