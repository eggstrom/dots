-- General options
vim.o.mouse = "a"     -- Enable mouse in all modes
vim.o.undofile = true -- Save undo history

-- Appearance
vim.o.cursorline = true     -- Highlight current line
vim.o.number = true         -- Enable line numbers
vim.o.relativenumber = true -- Enable relative line numbers
vim.o.signcolumn = "yes"    -- Always show sign column
vim.o.wrap = false          -- Disable wrapping
vim.o.showmode = false      -- Don't show mode in command line

-- Indentation
vim.o.expandtab = true -- Replace tab with spaces
vim.o.softtabstop = 4  -- Number of spaces in tab
vim.o.tabstop = 4      -- Width of tab
vim.o.shiftwidth = 4   -- Width of an indentation level

-- Searching
vim.o.ignorecase = true -- Disable case sensitivity
vim.o.smartcase = true  -- Enable case sensitivity when using caps

-- Folds (TODO: Enable fold column when PR #17446 gets merged)
vim.o.foldlevel = 99   -- Keep folds open by default
vim.o.foldcolumn = "0" -- Width of fold column
vim.opt.fillchars = {  -- Characters in fold column
    foldopen  = "",
    foldclose = "",
    foldsep   = " ",
}
