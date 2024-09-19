vim.g.copilot_enabled = false
set_option_toggle("Copilot", "h", "copilot_enabled", "g")

require("CopilotChat").setup()

vim.keymap.set("", "<leader>hc", "<cmd>CopilotChatToggle<CR>")
vim.keymap.set("", "<leader>he", "<cmd>CopilotChatExplain<CR>")
vim.keymap.set("", "<leader>hf", "<cmd>CopilotChatFix<CR>")
vim.keymap.set("", "<leader>ho", "<cmd>CopilotChatOptimize<CR>")
vim.keymap.set("", "<leader>hd", "<cmd>CopilotChatDocs<CR>")
vim.keymap.set("", "<leader>ht", "<cmd>CopilotChatTests<CR>")
vim.keymap.set("", "<leader>hr", "<cmd>CopilotChatReset<CR>")
