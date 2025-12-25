local plugins = {
  ['catppuccin/nvim'] = 'catppuccin',
  ['nvim-treesitter/nvim-treesitter'] = 'treesitter',
  ['neovim/nvim-lspconfig'] = 'lspconfig',
  ['lewis6991/gitsigns.nvim'] = 'gitsigns',
  ['ibhagwan/fzf-lua'] = 'fzf',
}

vim.call('plug#begin')
for url, name in pairs(plugins) do
  vim.fn['plug#'](url, { as = name })
end
vim.call('plug#end')

-- Install plugins if any are missing
local data_dir = vim.fn.stdpath('data')
for _, name in pairs(plugins) do
  if vim.fn.isdirectory(data_dir .. '/plugged/' .. name) == 0 then
    vim.cmd(':PlugInstall')
    break
  end
end

-- Set color scheme if truecolor is supported
if vim.env.COLORTERM == 'truecolor' or vim.env.COLORTERM == '24bit' then
  require('catppuccin')
  vim.cmd.colorscheme('catppuccin-mocha')
end

-- Enable LSP configs
vim.lsp.enable({
  'bashls',        -- Bash
  'clangd',        -- C, C++
  'glsl_analyzer', -- GLSL
  'gopls',         -- Go
  'lua_ls',        -- Lua
  'marksman',      -- Markdown
  'ruff',          -- Python (Linter and formatter)
  'rust_analyzer', -- Rust
  'taplo',         -- TOML
  'tinymist',      -- Typst
  'ts_ls',         -- JavaScript, TypeScript
  'ty',            -- Python (Type checker)
  'zls',           -- Zig
})
