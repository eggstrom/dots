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
      typescript # tsserver
      vim-language-server # vimls
      yaml-language-server # yamlls
      zls

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
      neodev-nvim
      none-ls-nvim

      nvim-cmp
      cmp-nvim-lsp
      cmp-cmdline
      cmp-buffer
      cmp-path
      luasnip
      cmp_luasnip

      telescope-nvim
      telescope-fzf-native-nvim
      telescope-file-browser-nvim

      copilot-vim
      CopilotChat-nvim

      lualine-nvim
      bufferline-nvim
      nvim-web-devicons

      nvim-colorizer-lua

      gitsigns-nvim
      nvim-autopairs
    ];
  };
}
