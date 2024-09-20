local settings = {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_attach = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("", "<leader>F", function()
            vim.lsp.buf.format({
                async = true,
                filter = function(client)
                    local disabled = { "cssls", "html", "jdtls", "jsonls", "ts_ls" }
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
    settings = {
        Lua = {
            completion = { callSnippet = "Replace" },
            runtime = { version = "LuaJIT" },
            workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME },
            },
        },
        ["rust-analyzer"] = {
            -- Disable snippet spam in completion menu
            completion = { postfix = { enable = false } },
        },
        zls = { enable_autofix = false },
    },
}

local lspconfig = require("lspconfig")

lspconfig.bashls.setup(settings)
lspconfig.clangd.setup(vim.tbl_extend("force", settings, {
    -- Forces offset encoding to prevent warnings
    cmd = { "clangd", "--offset-encoding=utf-16" },
}))
lspconfig.cssls.setup(settings)
lspconfig.dartls.setup(settings)
lspconfig.gopls.setup(settings)
lspconfig.html.setup(settings)
lspconfig.jdtls.setup(settings)
lspconfig.jsonls.setup(settings)
lspconfig.lemminx.setup(settings)
lspconfig.lua_ls.setup(vim.tbl_extend("force", settings, {
    on_init = function()
        require("neodev").setup()
    end,
}))
lspconfig.pyright.setup(settings)
lspconfig.nil_ls.setup(settings)
lspconfig.rust_analyzer.setup(settings)
lspconfig.taplo.setup(settings)
lspconfig.ts_ls.setup(settings)
lspconfig.vimls.setup(settings)
lspconfig.yamlls.setup(settings)
lspconfig.zls.setup(vim.tbl_extend("force", settings, {
    on_init = function()
        vim.g.zig_fmt_autosave = 0
    end,
}))
