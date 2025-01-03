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
    fd
    feh
    file
    firefox
    fzf
    gimp
    jq
    mpv
    obs-studio
    prismlauncher
    ripgrep
    steam
    steam-run
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
    valgrind
    zig
  ];

  # Generate caches for searching man pages
  programs.man.generateCaches = true;

  # Let Home Manager manage mimetypes
  xdg.mimeApps.enable = true;

  # Add ~/.local/bin/ to $PATH
  home.sessionPath = [ "${config.home.homeDirectory}/.local/bin" ];

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

  # Make sure keyd Unicode sequences are recognized
  home.file.".XCompose".source = "${pkgs.keyd}/share/keyd/keyd.compose";

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
