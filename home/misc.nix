{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      aria2
      bat
      bottom
      curl
      discord
      dust
      eza
      fd
      feh
      firefox
      fzf
      gimp
      jq
      manix
      mpv
      nix-search-cli
      obs-studio
      prismlauncher
      pulsemixer
      ripgrep
      steam
      tealdeer
      translate-shell
      trash-cli
      udiskie
      unzip
      wget
      wineWowPackages.stable
      yazi
      yt-dlp
      zip

      # Development
      act
      delta
      gcc
      git
      gnumake
      go
      just
      nasm
      nodejs
      python3
      rustup
      scrcpy
      valgrind
      zig

      # Theming and fonts
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      font-awesome
      catppuccin-cursors.mochaDark
      (catppuccin-gtk.override {
        variant = "mocha";
        accents = [ "red" ];
      })
    ];
  };
}
