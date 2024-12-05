{ config, pkgs, ... }:
{
  # Make $SUDO_EDITOR and $VISUAL depend on $EDITOR
  home.sessionVariables = {
    SUDO_EDITOR = config.home.sessionVariables.EDITOR;
    VISUAL = config.home.sessionVariables.EDITOR;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true; # Set $EDITOR

    extraPackages = with pkgs; [
      # Clipboard
      xclip
      wl-clipboard

      # LSPs
      bash-language-server # bashls
      clang-tools # clangd
      gopls
      jdt-language-server # jdtls
      lemminx
      lua-language-server # lua_ls
      marksman
      nixd
      pyright
      taplo
      typescript-language-server # ts_ls
      vim-language-server # vimls
      vscode-langservers-extracted # cssls, html, jsonls
      yaml-language-server # yamlls
      zls

      # Formatters
      black
      isort
      nixfmt-rfc-style
      prettierd
      shfmt
      stylua

      # Miscellaneous
      shellcheck # Used by bash-language-server
    ];

    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim

      nvim-treesitter.withAllGrammars

      nvim-lspconfig
      none-ls-nvim
      lazydev-nvim

      nvim-cmp
      cmp-nvim-lsp
      cmp-cmdline
      cmp-buffer
      cmp-path
      luasnip
      cmp_luasnip

      telescope-nvim
      telescope-fzf-native-nvim

      copilot-vim
      CopilotChat-nvim

      nvim-autopairs
      nvim-colorizer-lua
      gitsigns-nvim
      lualine-nvim
      nvim-web-devicons
    ];
  };

  xdg.configFile.nvim = {
    source = ./home/.config/nvim;
    recursive = true;
  };
}
