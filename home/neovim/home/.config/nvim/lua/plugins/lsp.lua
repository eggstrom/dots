local shared_config = {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  on_attach = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts)
    vim.keymap.set("", "<leader>F", function()
      vim.lsp.buf.format({
        async = true,
        filter = function(client)
          local disabled = { "cssls", "clangd", "html", "jdtls", "jsonls", "lua_ls", "ts_ls" }
          for _, lsp in ipairs(disabled) do
            if client.name == lsp then
              return false
            end
          end
          return true
        end,
      })
    end, opts)
  end,
}

local ts_ls_inlay_hint_settings = {
  includeInlayEnumMemberValueHints = true,
  includeInlayFunctionLikeReturnTypeHints = true,
  includeInlayFunctionParameterTypeHints = true,
  includeInlayParameterNameHints = "all",
  includeInlayParameterNameHintsWhenArgumentMatchesName = true,
  includeInlayPropertyDeclarationTypeHints = true,
  includeInlayVariableTypeHints = true,
}

local server_configs = {
  basedpyright = {}, -- Python
  bashls = {}, -- Bash
  clangd = { -- C, C++
    -- Force offset encoding to disable warnings
    cmd = { "clangd", "--offset-encoding=utf-16" },
  },
  csharp_ls = {}, -- C#
  cssls = {}, -- CSS
  dartls = {}, -- Dart
  gopls = {}, -- Go
  html = {}, -- HTML
  jdtls = {}, -- Java
  jsonls = {}, -- JSON
  lemminx = {}, -- XML
  lua_ls = { -- Lua
    settings = {
      Lua = {
        hint = { enable = true },
        completion = { callSnippet = "Replace" },
        runtime = { version = "LuaJIT" },
        workspace = {
          checkThirdParty = false,
          library = { vim.env.VIMRUNTIME },
        },
      },
    },
    on_init = function()
      require("lazydev").setup()
    end,
  },
  marksman = {}, -- Markdown
  nixd = {}, -- Nix
  rust_analyzer = {}, -- Rust
  taplo = {}, -- TOML
  ts_ls = { -- JavaScript, TypeScript
    settings = {
      javascript = { inlayHints = ts_ls_inlay_hint_settings },
      typescript = { inlayHints = ts_ls_inlay_hint_settings },
    },
  },
  vimls = {}, -- VimScript
  yamlls = {}, -- YAML
  zls = { -- Zig
    on_init = function()
      vim.g.zig_fmt_autosave = 0
    end,
  },
}

-- Configure LSPs
local lspconfig = require("lspconfig")
for server, config in pairs(server_configs) do
  lspconfig[server].setup(vim.tbl_extend("force", shared_config, config))
end

-- Configure formatters
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.formatting.stylua,
  },
})
