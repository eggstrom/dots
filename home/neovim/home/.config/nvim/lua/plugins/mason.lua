return {
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup()

        vim.keymap.set("", "<leader>m", "<cmd>Mason<CR>")

        local packages = {
            -- LSPs
            "bash-language-server",
            "clangd",
            "css-lsp",
            "gopls",
            "html-lsp",
            "jdtls",
            "json-lsp",
            "lemminx",
            "lua-language-server",
            "pyright",
            "rnix-lsp",
            "rust-analyzer",
            "taplo",
            "typescript-language-server",
            "vim-language-server",
            "yaml-language-server",
            "zls",

            -- DAPs
            "codelldb",
            "debugpy",
            "delve",

            -- Formatters
            "black",
            "clang-format",
            "isort",
            "prettier",
            "shfmt",
            "sql-formatter",
        }

        -- Install and update packages
        local registry = require("mason-registry")
        for _, name in ipairs(packages) do
            local package = registry.get_package(name)
            if not package:is_installed(name) then
                package:install()
            else
                package:check_new_version(function(success)
                    if success == true then
                        package:install()
                    end
                end)
            end
        end
    end,
}
