{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  home = {
    packages = with pkgs; [
      acpi
      aria2
      bash-completion
      bat
      brightnessctl
      cmake
      curl
      dotnet-sdk
      dust
      eww
      eza
      feh
      file
      firefox
      gcc
      gdb
      gh
      gimp
      git
      git-credential-manager
      gnumake
      go
      helix
      i3
      i3lock
      jdk
      jq
      just
      kitty
      kitty-themes
      lazygit
      luajit
      maim
      mcpelauncher-ui-qt
      mpc
      mpd
      mpv
      nodejs
      obs-studio
      pamixer
      picom
      prismlauncher
      pulseaudio
      pulsemixer
      python3
      ripgrep
      rustup
      sccache
      steam
      steam-run
      tealdeer
      tmux
      trash-cli
      typst
      unzip
      valgrind
      wget
      wineWowPackages.stable
      xclip
      xdotool
      xorg.xwininfo
      yazi
      yt-dlp
      zig
      zip

      # Language servers
      awk-language-server
      basedpyright
      bash-language-server
      clang-tools
      cmake-language-server
      dockerfile-language-server-nodejs
      glsl_analyzer
      gopls
      jdt-language-server
      lua-language-server
      marksman
      nixd
      omnisharp-roslyn
      ruff
      taplo
      tinymist
      typescript-language-server
      vscode-langservers-extracted
      wgsl-analyzer
      yaml-language-server
      zls

      # Debug adapters
      delve
      lldb
      netcoredbg

      # Formatters
      nixfmt-rfc-style
      shfmt
      zig
    ];

    file =
      let
        files = "${inputs.self.outPath}/files/home";
      in
      builtins.readDir files
      |> builtins.attrNames
      |> map (file: {
        name = file;
        value = {
          source = "${files}/${file}";
          recursive = true;
        };
      })
      |> builtins.listToAttrs;
  };

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
}
