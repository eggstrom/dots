-- Disable completions by default and add mapping to toggle them
vim.g.copilot_enabled = false
vim.keymap.set_toggle("h", "Copilot", { "g", "copilot_enabled" })

-- Set up Copilot chat
require("CopilotChat").setup()
vim.keymap.set("", "<leader>hc", "<cmd>CopilotChatToggle<CR>")
vim.keymap.set("", "<leader>he", "<cmd>CopilotChatExplain<CR>")
vim.keymap.set("", "<leader>hf", "<cmd>CopilotChatFix<CR>")
vim.keymap.set("", "<leader>ho", "<cmd>CopilotChatOptimize<CR>")
vim.keymap.set("", "<leader>hd", "<cmd>CopilotChatDocs<CR>")
vim.keymap.set("", "<leader>ht", "<cmd>CopilotChatTests<CR>")
vim.keymap.set("", "<leader>hr", "<cmd>CopilotChatReset<CR>")
