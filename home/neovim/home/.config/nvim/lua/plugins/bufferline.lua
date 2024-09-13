require("bufferline").setup({
    options = {
        always_show_bufferline = false,
        show_duplicate_prefix = false,
        diagnostics = "nvim_lsp",
        offsets = { { filetype = "NvimTree" } },
    }
})
