local git = require('gitsigns')
local fzf = require('fzf-lua')
git.setup()
fzf.setup({ 'ivy' })

local function get_range()
  if vim.api.nvim_get_mode().mode ~= 'v' then return nil end
  local getpos = vim.fn.getpos
  return { getpos('.')[2], getpos('v')[2] }
end

-- Toggle line numbers
vim.keymap.set('', '<Leader>tn', function()
  vim.o.number = not vim.o.number
end)
-- Toggle relative line numbers
vim.keymap.set('', '<Leader>tr', function()
  vim.o.relativenumber = not vim.o.relativenumber
end)
-- Toggle line wrapping
vim.keymap.set('', '<Leader>tw', function()
  vim.o.wrap = not vim.o.wrap
end)
-- Toggle line breaking
vim.keymap.set('', '<Leader>tb', function()
  if vim.v.count == 0 then
    vim.o.textwidth = vim.o.textwidth == 0 and 80 or 0
  else
    vim.o.textwidth = vim.o.textwidth == vim.v.count and 0 or vim.v.count
  end
end)
-- Toggle list mode
vim.keymap.set('', '<Leader>tl', function()
  vim.o.list = not vim.o.list
end)
-- Toggle spell checking
vim.keymap.set('', '<Leader>ts', function()
  vim.o.spell = not vim.o.spell
end)
-- Toggle inlay hints
vim.keymap.set('', '<Leader>th', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)
-- Toggle diagnostics
vim.keymap.set('', '<Leader>td', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end)

-- Toggle diagnostic virtual lines
vim.keymap.set('', '<C-k>', function()
  local config = vim.diagnostic.config() or {}
  if config.virtual_lines then
    config.virtual_lines = false
  else
    config.virtual_lines = { current_line = true }
  end
  vim.diagnostic.config(config)
end)

-- LSP
vim.keymap.set('n', 'grd', vim.diagnostic.setloclist)
vim.keymap.set('n', 'grD', vim.diagnostic.setqflist)
vim.keymap.set('n', 'g<C-o>', vim.lsp.buf.workspace_symbol)
vim.keymap.set({ 'n', 'v' }, 'grf', function()
  vim.lsp.buf.format({
    async = true,
    -- Disable formatting for some servers
    filter = function(client)
      return not vim.tbl_contains({}, client.name)
    end
  })
end)

-- Git
vim.keymap.set('', '[h', function() git.nav_hunk('prev') end)
vim.keymap.set('', ']h', function() git.nav_hunk('next') end)
vim.keymap.set('', '[H', function() git.nav_hunk('first') end)
vim.keymap.set('', ']H', function() git.nav_hunk('last') end)
vim.keymap.set('', '<Leader>s', function() git.stage_hunk(get_range()) end)
vim.keymap.set('', '<Leader>S', git.stage_buffer)
vim.keymap.set('', '<Leader>u', function() git.reset_hunk(get_range()) end)
vim.keymap.set('', '<Leader>U', git.reset_buffer)

-- FZF
vim.keymap.set('', '<Leader>j', fzf.jumps)
vim.keymap.set('', '<Leader>m', fzf.marks)
vim.keymap.set('', '<Leader>f', fzf.files)
vim.keymap.set('', '<Leader>F', fzf.oldfiles)
vim.keymap.set('', '<Leader>/', function() fzf.live_grep({ resume = true, hidden = true }) end)
vim.keymap.set('', '<Leader>b', fzf.buffers)
vim.keymap.set('', '<Leader><C-u>', fzf.undotree)
vim.keymap.set('', '<Leader>g', fzf.git_status)
vim.keymap.set('', '<Leader>B', fzf.git_blame)
vim.keymap.set('', '<Leader>d', fzf.lsp_definitions)
vim.keymap.set('', '<Leader>D', fzf.lsp_declarations)
vim.keymap.set('', '<Leader>ri', fzf.lsp_implementations)
vim.keymap.set('', '<Leader>rt', fzf.lsp_typedefs)
vim.keymap.set('', '<Leader>rr', fzf.lsp_references)
vim.keymap.set('', '<Leader>O', fzf.lsp_document_symbols)
vim.keymap.set('', '<Leader><C-o>', fzf.lsp_workspace_symbols)
vim.keymap.set('', '<Leader>rd', fzf.diagnostics_document)
vim.keymap.set('', '<Leader>rD', fzf.diagnostics_workspace)
vim.keymap.set('', '<Leader>ra', function() fzf.lsp_code_actions({ silent = true }) end)
vim.keymap.set('', '<Leader>k', fzf.keymaps)
vim.keymap.set('', '<Leader>h', fzf.helptags)
vim.keymap.set('', '<Leader>M', fzf.manpages)
