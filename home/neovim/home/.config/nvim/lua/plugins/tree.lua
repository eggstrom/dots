require("nvim-tree").setup({
    sync_root_with_cwd = true,
    view = { width = { max = 30 }, },
    renderer = { root_folder_label = false },
    filters = { git_ignored = false },
    diagnostics = { enable = true },
    on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }

        -- Navigation
        vim.keymap.set("n", "<leader>t", api.tree.close, opts)
        vim.keymap.set("n", "q", api.tree.close, opts)
        vim.keymap.set("n", "<CR>", api.tree.change_root_to_node, opts)
        vim.keymap.set("n", "<BS>", api.tree.change_root_to_parent, opts)
        vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts)
        vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts)
        vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts)
        vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts)

        -- File visibility
        vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts)
        vim.keymap.set("n", "zr", api.tree.expand_all, opts)
        vim.keymap.set("n", "zm", api.tree.collapse_all, opts)
        vim.keymap.set("n", "zh", api.tree.toggle_hidden_filter, opts)
        vim.keymap.set("n", "zb", api.tree.toggle_no_buffer_filter, opts)
        vim.keymap.set("n", "zi", api.tree.toggle_gitignore_filter, opts)
        vim.keymap.set("n", "zc", api.tree.toggle_git_clean_filter, opts)
        vim.keymap.set("n", "f", api.live_filter.start, opts)
        vim.keymap.set("n", "F", api.live_filter.clear, opts)

        -- File editing
        vim.keymap.set("n", "o", api.node.open.no_window_picker, opts)
        vim.keymap.set("n", "O", api.node.open.edit, opts)
        vim.keymap.set("n", "a", api.fs.create, opts)
        vim.keymap.set("n", "r", api.fs.rename, opts)
        vim.keymap.set("n", "y", api.fs.copy.node, opts)
        vim.keymap.set("n", "cf", api.fs.copy.filename, opts)
        vim.keymap.set("n", "ca", api.fs.copy.absolute_path, opts)
        vim.keymap.set("n", "cr", api.fs.copy.relative_path, opts)
        vim.keymap.set("n", "x", api.fs.cut, opts)
        vim.keymap.set("n", "p", api.fs.paste, opts)
        vim.keymap.set("n", "d", api.fs.trash, opts)
        vim.keymap.set("n", "D", api.fs.remove, opts)
    end,
})

vim.keymap.set("", "<leader>t", "<cmd>NvimTreeOpen<CR>")
