vim.opt.undofile = true -- Save undo history

-- Controls
vim.opt.mouse = "a" -- Enable mouse in all modes
vim.opt.timeout = false -- Disable leader key timeout
vim.opt.virtualedit = "block" -- Enable virtual editing in visual block mode

-- Appearance
vim.opt.cursorline = true -- Highlight current line
vim.opt.number = true -- Enable line numbers
vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.wrap = false -- Disable wrapping
vim.opt.showmode = false -- Don't show mode in command line
vim.opt.shortmess:append("I") -- Disable intro message on startup

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

-- Splits
vim.opt.splitbelow = true -- Create new windows below instead of above
vim.opt.splitright = true -- Create new windows right instead of left

-- Diagnostics
vim.diagnostic.config({
    signs = {
        -- Order: error, warn, info, hint
        text = { "󰅚", "󰀪", "󰋽", "󰌶" },
        numhl = { "DiagnosticError", "DiagnosticWarn", "DiagnosticInfo", "DiagnosticHint" },
    },
})
