-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Controls
vim.o.mouse = 'a'           -- Enable mouse in all modes
vim.o.timeout = false       -- Disable leader key timeout
vim.o.virtualedit = 'block' -- Enable virtual editing in visual block mode

-- Saving
vim.o.swapfile = false          -- Disable swap file
vim.o.undofile = true           -- Save undo history
vim.o.clipboard = 'unnamedplus' -- Save unnamed register content to clipboard

-- Appearance
vim.o.cursorline = true       -- Highlight current line
vim.o.number = true           -- Enable line numbers
vim.o.relativenumber = true   -- Enable relative line numbers
vim.o.signcolumn = 'yes'      -- Always show sign column
vim.opt.shortmess:append('I') -- Disable intro message

-- Scrolling
vim.o.scrolloff = 4       -- Show some lines around cursor
vim.o.sidescrolloff = 8   -- Show some columns around cursor
vim.o.smoothscroll = true -- Scroll one line at a time with wrapped text

-- Lines
vim.o.wrap = false       -- Disable line wrapping
vim.o.linebreak = true   -- Only wrap lines on certain characters
vim.o.colorcolumn = '+1' -- Show column indicating where lines will be broken

-- Indentation
vim.o.expandtab = true  -- Replace <Tab> with spaces
vim.o.softtabstop = 2   -- Number of spaces in a <Tab>
vim.o.tabstop = 2       -- Width of a <Tab>
vim.o.shiftwidth = 2    -- Width of an indentation level
vim.o.shiftround = true -- Round when changing indentation

-- Folds
vim.o.foldlevel = 99                               -- Keep folds open by default
vim.o.foldmethod = 'expr'                          -- Use foldexpr for folds
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()' -- Use treesitter for folds
vim.o.foldtext = ''                                -- Make fold text prettier

-- Searching
vim.o.ignorecase = true -- Disable case sensitivity
vim.o.smartcase = true  -- Enable case sensitivity when using caps

-- Completion
vim.o.pumheight = 10 -- Limit number of items in the menu
vim.opt.completeopt = {
  'menuone',         -- Show menu, even if there's only one item
  'noselect',        -- Don't automatically select the first item
  'popup',           -- Show information about the selected item in a popup
  'fuzzy',           -- Use fuzzy matching
}

-- Diagnostics
vim.diagnostic.config({
  update_in_insert = true, -- Keep updating diagnostics in insert mode
  virtual_text = true,     -- Show inline diagnostics
})

-- Windows
vim.o.splitbelow = true    -- Create new windows below instead of above
vim.o.splitright = true    -- Create new windows right instead of left
vim.o.winborder = 'single' -- Add border to floating windows

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
