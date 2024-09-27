-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Yank/paste to clipboard
vim.keymap.set("", "<leader>y", '"+y')
vim.keymap.set("", "<leader>p", '"+p')

-- Hide search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Move to next/previous buffer
vim.keymap.set({ "n", "v" }, "<Tab>", "<cmd>bnext<CR>")
vim.keymap.set({ "n", "v" }, "<S-Tab>", "<cmd>bprevious<CR>")

-- Open window with diagnostics
vim.keymap.set("", "<leader>d", vim.diagnostic.open_float)

-- Toggle line numbers
vim.keymap.set("", "<leader>tn", function()
    vim.o.number = not vim.o.number
end)
-- Toggle relative line numbers
vim.keymap.set("", "<leader>tr", function()
    vim.o.relativenumber = not vim.o.relativenumber
end)
-- Toggle wrapping
vim.keymap.set("", "<leader>tw", function()
    vim.o.wrap = not vim.o.wrap
end)
-- Toggle spell checking
vim.keymap.set("", "<leader>ts", function()
    vim.o.spell = not vim.o.spell
end)
-- Toggle diagnostics
vim.keymap.set("", "<leader>td", function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end)
