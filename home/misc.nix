{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aria2
    bat
    btop
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
    yazi
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

  services.udiskie = {
    enable = true;
    tray = "never";
  };

  xdg.configFile.npmrc.source = ../dotfiles/.config/npmrc;
}
