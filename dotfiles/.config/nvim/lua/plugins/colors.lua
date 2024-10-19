if os.getenv("TERM") ~= "linux" then
    require("catppuccin").setup()
    vim.cmd.colorscheme("catppuccin-mocha")

    require("colorizer").setup({
        filetypes = {}, -- Disable by default
        user_default_options = {
            css = true, -- Enable all CSS color types
        },
    })

    -- Toggle colors
    vim.keymap.set("", "<leader>tc", "<cmd>ColorizerToggle<CR>")
end
