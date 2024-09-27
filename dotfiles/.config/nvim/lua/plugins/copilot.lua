-- Disable completions by default
vim.g.copilot_enabled = false
-- Toggle completions
vim.keymap.set("", "<leader>th", function()
    vim.g.copilot_enabled = not vim.g.copilot_enabled
end)

-- Set up Copilot chat
require("CopilotChat").setup()
vim.keymap.set("", "<leader>hc", "<cmd>CopilotChatToggle<CR>")
vim.keymap.set("", "<leader>he", "<cmd>CopilotChatExplain<CR>")
vim.keymap.set("", "<leader>hf", "<cmd>CopilotChatFix<CR>")
vim.keymap.set("", "<leader>ho", "<cmd>CopilotChatOptimize<CR>")
vim.keymap.set("", "<leader>hd", "<cmd>CopilotChatDocs<CR>")
vim.keymap.set("", "<leader>ht", "<cmd>CopilotChatTests<CR>")
vim.keymap.set("", "<leader>hr", "<cmd>CopilotChatReset<CR>")
