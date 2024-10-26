require("nvim-autopairs").setup()

require("lualine").setup({
    options = {
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
    },
})

require("bufferline").setup({
    options = {
        always_show_bufferline = false,
        show_duplicate_prefix = false,
        diagnostics = "nvim_lsp",
    },
})

require("render-markdown").setup({ enabled = false })
vim.keymap.set("", "<leader>tm", require("render-markdown").toggle)
