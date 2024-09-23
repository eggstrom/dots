require("nvim-autopairs").setup()

require("lualine").setup({
    options = {
        component_separators = "│",
        section_separators = "",
    },
})

require("bufferline").setup({
    options = {
        always_show_bufferline = false,
        show_duplicate_prefix = false,
        diagnostics = "nvim_lsp",
    },
})
