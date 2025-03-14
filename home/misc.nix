{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    aria2
    bat
    curl
    dust
    eza
    feh
    file
    firefox
    gimp
    jq
    mpv
    obs-studio
    ripgrep
    translate-shell
    trash-cli
    unzip
    wget
    yt-dlp
    zip

    # Development
    act
    cmake
    dotnet-sdk
    gcc
    gdb
    gnumake
    go
    jdk
    just
    nasm
    nodejs
    python3
    rustup
    sccache
    scrcpy
    typst
    valgrind
    zig
  ];

  # Generate caches for searching man pages
  programs.man.generateCaches = true;

  # Let Home Manager manage mimetypes
  xdg.mimeApps.enable = true;

  # Enable automounting daemon
  services.udiskie.enable = true;
  # Make daemon start on login
  systemd.user.services.udiskie = {
    Install.WantedBy = lib.mkForce [ "default.target" ];
    Unit = {
      After = lib.mkForce [ ];
      PartOf = lib.mkForce [ ];
    };
  };

  # Enable tldr and make it update on execution if needed
  programs.tealdeer = {
    enable = true;
    settings.updates = {
      auto_update = true;
      # Update if cached data is older than a week
      auto_update_interval_hours = 168;
    };
  };

  # ~/.npm/ -> ~/.cache/npm/
  xdg.configFile.npmrc.text = "cache=${config.xdg.cacheHome}/npm";
}
