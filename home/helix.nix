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

        auto-pairs = false;
        smart-tab = false;
        file-picker = {
          hidden = false; # Show hidden files
          deduplicate-links = false; # Don't remove links
        };

        auto-format = false;
        completion-timeout = 5; # Show completions instantly
        completion-trigger-len = 1; # Show completions after typing 1 character
        lsp.snippets = false;
        end-of-line-diagnostics = "hint";
        inline-diagnostics.cursor-line = "hint";
      };

      keys =
        let
          moveSelectionDown = [ "extend_to_line_bounds" "delete_selection" "paste_after" ];
          moveSelectionUp = [ "extend_to_line_bounds" "delete_selection" "move_line_up" "paste_before" ];

          normalAndSelectKeys = {
            C-left = "unindent";
            C-down = moveSelectionDown;
            C-up = moveSelectionUp;
            C-right = "indent";
            C-h = "unindent";
            C-j = moveSelectionDown;
            C-k = moveSelectionUp;
            C-l = "indent";

            space.t = {
              n = ":toggle line-number absolute relative";
              w = ":toggle soft-wrap.enable";
              s = ":toggle whitespace.render none all";
              h = ":toggle lsp.display-inlay-hints";
              c = ":toggle search.smart-case";
            };
          };
        in
        {
          normal = normalAndSelectKeys;
          select = normalAndSelectKeys;
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
