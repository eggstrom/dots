{ config, pkgs, ... }:
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
    source = ./home/.config/nvim;
    recursive = true;
  };

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim

      nvim-treesitter.withAllGrammars

      nvim-cmp
      cmp-nvim-lsp
      cmp-cmdline
      cmp-buffer
      cmp-path
      luasnip
      cmp_luasnip

      nvim-lspconfig
      neodev-nvim

      telescope-nvim
      telescope-fzf-native-nvim

      copilot-vim
      CopilotChat-nvim

      nvim-tree-lua
      lualine-nvim
      bufferline-nvim
      nvim-web-devicons

      nvim-colorizer-lua

      comment-nvim
      todo-comments-nvim

      nvim-ufo
      gitsigns-nvim
      indent-blankline-nvim
      none-ls-nvim
      nvim-autopairs
    ];
  };
}
