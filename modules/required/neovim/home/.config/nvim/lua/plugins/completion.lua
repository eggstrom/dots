local cmp = require("cmp")

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.scroll_docs(4),
        ["<C-k>"] = cmp.mapping.scroll_docs(-4),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    formatting = {
        format = function(_, vim_item)
            vim_item.menu = ""
            return vim_item
        end,
    },
})

cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = "buffer" } },
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "path" },
        { name = "cmdline" },
    },
})
