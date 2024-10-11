{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aria2
    bat
    curl
    (discord.override { withVencord = true; })
    dust
    eza
    fd
    feh
    firefox
    fzf
    gimp
    jq
    mpv
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
    yt-dlp
    zip

    # Development
    act
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
  ];

  xdg.configFile.npmrc.source = ../dotfiles/.config/npmrc;

  services.udiskie = {
    enable = true;
    tray = "never";
  };

  # Generate caches for searching man pages
  programs.man.generateCaches = true;
}
