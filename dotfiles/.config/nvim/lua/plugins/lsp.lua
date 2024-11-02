local function settings(extra_settings)
    extra_settings = extra_settings or {}

    return vim.tbl_extend("force", {
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
    }, extra_settings)
end

-- Configure LSPs
local lspconfig = require("lspconfig")
-- Bash
lspconfig.bashls.setup(settings())
-- C, C++
lspconfig.clangd.setup(settings({
    -- Force offset encoding to disable warnings
    cmd = { "clangd", "--offset-encoding=utf-16" },
}))
-- CSS
lspconfig.cssls.setup(settings())
-- Dart
lspconfig.dartls.setup(settings())
-- Go
lspconfig.gopls.setup(settings())
-- HTML
lspconfig.html.setup(settings())
-- Java
lspconfig.jdtls.setup(settings())
-- JavaScript, TypeScript
local inlay_hint_settings = {
    includeInlayEnumMemberValueHints = true,
    includeInlayFunctionLikeReturnTypeHints = true,
    includeInlayFunctionParameterTypeHints = true,
    includeInlayParameterNameHints = "all",
    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
    includeInlayPropertyDeclarationTypeHints = true,
    includeInlayVariableTypeHints = true,
}
lspconfig.ts_ls.setup(settings({
    settings = {
        javascript = { inlayHints = inlay_hint_settings },
        typescript = { inlayHints = inlay_hint_settings },
    },
}))
-- JSON
lspconfig.jsonls.setup(settings())
-- Lua
lspconfig.lua_ls.setup(settings({
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
}))
-- Markdown
lspconfig.marksman.setup(settings())
-- Nix
lspconfig.nixd.setup(settings())
-- Python
lspconfig.pyright.setup(settings())
-- Rust
lspconfig.rust_analyzer.setup(settings())
-- TOML
lspconfig.taplo.setup(settings())
-- VimScript
lspconfig.vimls.setup(settings())
-- XML
lspconfig.lemminx.setup(settings())
-- YAML
lspconfig.yamlls.setup(settings())
-- Zig
lspconfig.zls.setup(settings({
    on_init = function()
        vim.g.zig_fmt_autosave = 0
    end,
}))

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
