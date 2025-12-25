local treesitter = require('nvim-treesitter')
local available = treesitter.get_available()
local installed = treesitter.get_installed()

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({
      higroup = 'Visual', -- Use correct color
    })
  end
})

-- Start tree-sitter
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local buf = args.buf
    local filetype = args.match
    if filetype == '' then return end

    local lang = vim.treesitter.language.get_lang(filetype)
    if lang == nil then return end

    local function start_parser()
      vim.treesitter.start(buf, lang)
    end

    if vim.treesitter.language.add(lang) then
      if vim.tbl_contains(installed, lang) then
        treesitter.update(lang):await(start_parser)
      else
        start_parser()
      end
    else
      if vim.tbl_contains(available, lang) then
        treesitter.install(lang):await(start_parser)
      end
    end
  end
})

-- Enable supported LSP functionality
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then return end

    -- Replace default jump to definition/declaration
    if client:supports_method('textDocument/definition') then
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
    end
    if client:supports_method('textDocument/declaration') then
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
    end

    -- Completion
    if client:supports_method('textDocument/completion') then
      -- Open completion menu on every key press
      local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
      client.server_capabilities.completionProvider.triggerCharacters = chars

      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end
})
