{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkMerge [
  {
    catppuccin.accent = "blue";
  }
  (lib.mkIf (!config.userConfig.minimal) {
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      font-awesome
    ];

    home.pointerCursor = {
      package = pkgs.catppuccin-cursors.mochaDark;
      name = "catppuccin-mocha-dark-cursors";
      size = 42;
      gtk.enable = true;
    };

    gtk = {
      enable = true;
      theme = {
        package = (
          pkgs.catppuccin-gtk.override {
            variant = "mocha";
            accents = [ "blue" ];
          }
        );
        name = "catppuccin-mocha-blue-standard";
      };

      # ~/.gtkrc-2.0 -> ~/.config/gtkrc-2.0
      gtk2.configLocation = "${config.xdg.configHome}/gtkrc-2.0";
    };

    qt = {
      enable = true;
      platformTheme.name = "kvantum";
      style.name = "kvantum";
    };
    catppuccin.kvantum = {
      enable = true;
      apply = true;
    };
  })
]
