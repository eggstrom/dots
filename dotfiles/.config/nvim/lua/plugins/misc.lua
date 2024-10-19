require("nvim-autopairs").setup()

require("lualine").setup()
require("bufferline").setup({
    options = {
        always_show_bufferline = false,
        show_duplicate_prefix = false,
        diagnostics = "nvim_lsp",
    },
})

require("render-markdown").setup({ enabled = false })
vim.keymap.set("", "<leader>tm", require("render-markdown").toggle)
