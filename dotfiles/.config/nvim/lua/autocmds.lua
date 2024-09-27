-- Highlight after yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({
            higroup = "Visual", -- Use correct color
            on_visual = false, -- Disable in visual mode
        })
    end,
})
