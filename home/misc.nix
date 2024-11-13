{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    aria2
    bat
    curl
    dust
    eza
    fd
    feh
    file
    firefox
    fzf
    gdb
    gimp
    jq
    mpv
    obs-studio
    prismlauncher
    ripgrep
    steam
    steam-run
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
    cmake
    gcc
    gnumake
    go
    jdk
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

  # Add ~/.local/bin to $PATH
  home.sessionPath = [ "${config.home.homeDirectory}/.local/bin" ];
}
