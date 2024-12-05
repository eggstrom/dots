local telescope = require("telescope")
telescope.setup({
    defaults = {
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    },
    pickers = {
        find_files = {
            follow = true,
            hidden = true,
            no_ignore = true,
            no_ignore_parent = true,
        },
        live_grep = {
            additional_args = { "--follow", "--hidden", "--no-ignore" },
        },
    },
})
telescope.load_extension("fzf")

local builtin = require("telescope.builtin")
vim.keymap.set("", "<leader>fa", builtin.builtin) -- All
vim.keymap.set("", "<leader>fj", builtin.jumplist) -- Jump list
vim.keymap.set("", "<leader>fh", builtin.help_tags) -- Help
vim.keymap.set("", "<leader>fm", builtin.man_pages) -- Man pages
vim.keymap.set("", "<leader>fb", builtin.buffers) -- Buffers
vim.keymap.set("", "<leader>ff", builtin.find_files) -- Files
vim.keymap.set("", "<leader>fc", function() -- Files in ~/.nix
    builtin.find_files({ cwd = "~/.nix" })
end)
vim.keymap.set("", "<leader>fo", builtin.oldfiles) -- Old files
vim.keymap.set("", "<leader>fg", builtin.live_grep) -- Live grep
vim.keymap.set("", "<leader>fd", builtin.diagnostics) -- Diagnostics
vim.keymap.set("", "<leader>fr", builtin.lsp_references) -- References
vim.keymap.set("", "<leader>fs", builtin.lsp_document_symbols) -- Document symbols
vim.keymap.set("", "<leader>fS", builtin.lsp_workspace_symbols) -- Workspace symbols
