-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Controls
vim.o.mouse = 'a'           -- Enable mouse in all modes
vim.o.timeout = false       -- Disable leader key timeout
vim.o.virtualedit = 'block' -- Enable virtual editing in visual block mode

-- Saved state
vim.o.undofile = true  -- Save undo history
vim.o.swapfile = false -- Disable swap file

-- Appearance
vim.o.cursorline = true       -- Highlight current line
vim.o.number = true           -- Enable line numbers
vim.o.relativenumber = true   -- Enable relative line numbers
vim.o.signcolumn = 'yes'      -- Always show sign column
vim.o.wrap = false            -- Disable wrapping
vim.opt.shortmess:append('I') -- Disable intro message on startup

-- Indentation
vim.o.expandtab = true -- Replace tab with spaces
vim.o.softtabstop = 4  -- Number of spaces in tab
vim.o.tabstop = 4      -- Width of tab
vim.o.shiftwidth = 4   -- Width of an indentation level

-- Searching
vim.o.ignorecase = true -- Disable case sensitivity
vim.o.smartcase = true  -- Enable case sensitivity when using caps

-- Folds
vim.o.foldlevel = 99                               -- Keep folds open by default
vim.o.foldmethod = 'expr'                          -- Use foldexpr for folds
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()' -- Use treesitter for folds
vim.o.foldtext = ''                                -- Make fold text prettier

-- Windows
vim.o.splitbelow = true    -- Create new windows below instead of above
vim.o.splitright = true    -- Create new windows right instead of left
vim.o.winborder = 'single' -- Add border to floating windows

-- Completion
vim.opt.completeopt = {
  'menuone',  -- Show menu, even if there's only one match
  'noselect', -- Don't automatically select the first match
  'popup',    -- Show information about the selected match in a popup
  'fuzzy',    -- Use fuzzy matching
}

-- Diagnostics
vim.diagnostic.config({
  virtual_text = true -- Show inline diagnostics
})

-- Status line
vim.o.statusline = '%<%f %h%w%m%r%=%{%v:lua.statusline_file_info()%}%l/%L,%c%V %P'
function statusline_file_info()
  local bo = vim.bo
  local ft, ff, fe = bo.filetype, bo.fileformat, bo.fileencoding

  local info = ''
  if ft ~= '' then info = info .. ft .. ' ' end
  if ff ~= '' then info = info .. ff .. ' ' end
  if fe ~= '' then info = info .. fe .. ' ' end
  return info
end
