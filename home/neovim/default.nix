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

  xdg.configFile = {
    "nvim/init.lua".source = home/.config/nvim/init.lua;
    "nvim/lua/keymaps.lua".source = home/.config/nvim/lua/keymaps.lua;
    "nvim/lua/options.lua".source = home/.config/nvim/lua/options.lua;
    "nvim/lua/plugins/bufferline.lua".source = home/.config/nvim/lua/plugins/bufferline.lua;
    "nvim/lua/plugins/colors.lua".source = home/.config/nvim/lua/plugins/colors.lua;
    "nvim/lua/plugins/colorscheme.lua".source = home/.config/nvim/lua/plugins/colorscheme.lua;
    "nvim/lua/plugins/comments.lua".source = home/.config/nvim/lua/plugins/comments.lua;
    "nvim/lua/plugins/completion.lua".source = home/.config/nvim/lua/plugins/completion.lua;
    "nvim/lua/plugins/copilot.lua".source = home/.config/nvim/lua/plugins/copilot.lua;
    "nvim/lua/plugins/folds.lua".source = home/.config/nvim/lua/plugins/folds.lua;
    "nvim/lua/plugins/git.lua".source = home/.config/nvim/lua/plugins/git.lua;
    "nvim/lua/plugins/indents.lua".source = home/.config/nvim/lua/plugins/indents.lua;
    "nvim/lua/plugins/lsp.lua".source = home/.config/nvim/lua/plugins/lsp.lua;
    "nvim/lua/plugins/lualine.lua".source = home/.config/nvim/lua/plugins/lualine.lua;
    "nvim/lua/plugins/none-ls.lua".source = home/.config/nvim/lua/plugins/none-ls.lua;
    "nvim/lua/plugins/pairs.lua".source = home/.config/nvim/lua/plugins/pairs.lua;
    "nvim/lua/plugins/telescope.lua".source = home/.config/nvim/lua/plugins/telescope.lua;
    "nvim/lua/plugins/tree.lua".source = home/.config/nvim/lua/plugins/tree.lua;
    "nvim/lua/plugins/treesitter.lua".source = home/.config/nvim/lua/plugins/treesitter.lua;
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
