{ pkgs, ... }:
{
  home.packages = with pkgs; [
    helix

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

  xdg.configFile.helix = {
    source = ./home/.config/helix;
    recursive = true;
  };
}
