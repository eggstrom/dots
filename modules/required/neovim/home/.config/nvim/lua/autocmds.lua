-- Highlight after yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      on_visual = false, -- Disable in visual mode
      higroup = "Visual", -- Use correct color
    })
  end,
})
