{ config, pkgs, ... }:
{
  # Make $SUDO_EDITOR and $VISUAL depend on $EDITOR
  home.sessionVariables = {
    SUDO_EDITOR = config.home.sessionVariables.EDITOR;
    VISUAL = config.home.sessionVariables.EDITOR;
  };

  programs.helix = {
    enable = true;
    defaultEditor = true; # Set $EDITOR
    extraPackages = with pkgs; [
      # Language servers
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
      zig
    ];

    settings = {
      theme = "catppuccin_mocha";

      editor = {
        cursorline = true;
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };

        line-number = "relative";
        bufferline = "multiple";

        file-picker = {
          hidden = false; # Show hidden files
          deduplicate-links = false; # Don't remove links
        };

        auto-format = false;
        lsp.snippets = false;
        end-of-line-diagnostics = "hint";
        inline-diagnostics.cursor-line = "hint";
      };

      keys =
        let
          toggleKeys = {
            w = ":toggle soft-wrap.enable";
            s = ":toggle whitespace.render all none";
            h = ":toggle lsp.display-inlay-hints";
          };
        in
        {
          normal.space.t = toggleKeys;
          select.space.t = toggleKeys;
        };
    };

    languages = {
      language = [
        { name = "nix"; language-servers = [ "nixd" ]; }
        { name = "python"; language-servers = [ "basedpyright" "ruff" ]; }
      ];
    };
  };
}
