-- General options
vim.opt.mouse = "a" -- Enable mouse in all modes
vim.opt.timeout = false -- Disable leader key timeout
vim.opt.undofile = true -- Save undo history

-- Appearance
vim.opt.cursorline = true -- Highlight current line
vim.opt.number = true -- Enable line numbers
vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.wrap = false -- Disable wrapping
vim.opt.showmode = false -- Don't show mode in command line

-- Indentation
vim.opt.expandtab = true -- Replace tab with spaces
vim.opt.softtabstop = 4 -- Number of spaces in tab
vim.opt.tabstop = 4 -- Width of tab
vim.opt.shiftwidth = 4 -- Width of an indentation level

-- Searching
vim.opt.ignorecase = true -- Disable case sensitivity
vim.opt.smartcase = true -- Enable case sensitivity when using caps

-- Folds
vim.opt.foldlevel = 99 -- Keep folds open by default
vim.opt.foldmethod = "expr" -- Use foldexpr for folds
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- Use treesitter for folds
vim.opt.foldtext = "" -- Make fold text prettier
