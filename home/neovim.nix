{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      # Clipboard
      xclip
      wl-clipboard

      # LSPs
      bash-language-server # bashls
      gopls
      java-language-server # jdtls
      lemminx
      libclang # clangd
      lua-language-server # lua_ls
      nil # nil_ls
      # rust-analyzer # rust_analyzer
      vscode-langservers-extracted # cssls, html, jsonls
      pyright
      taplo
      typescript-language-server # ts_ls
      vim-language-server # vimls
      yaml-language-server # yamlls
      zls

      # Formatters
      black
      isort
      prettierd
      shfmt
      stylua

      # Miscellaneous
      shellcheck # Used by bash-language-server
    ];
  };

  xdg.configFile.nvim = {
    source = ../dotfiles/.config/nvim;
    recursive = true;
  };

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim

      nvim-treesitter.withAllGrammars

      nvim-lspconfig
      none-ls-nvim
      neodev-nvim

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
      bufferline-nvim
      nvim-web-devicons
    ];
  };
}
