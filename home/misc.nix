{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    aria2
    bat
    btop
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
    pulseaudio
    ripgrep
    steam
    tealdeer
    translate-shell
    trash-cli
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

    # Fonts
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    font-awesome
  ];

  services.udiskie = {
    enable = true;
    tray = "never";
  };

  xdg.configFile.npmrc.source = ../dotfiles/.config/npmrc;
}
