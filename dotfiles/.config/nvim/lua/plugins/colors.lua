if os.getenv("TERM") ~= "linux" then
    require("colorizer").setup({
        filetypes = { "*", "!NvimTree", "!TelescopePrompt", "!TelescopeResults" },
        user_default_options = {
            names = false,
            RRGGBBAA = true,
            AARRGGBB = true,
            rgb_fn = true,
            hsl_fn = true,
        },
    })

    vim.keymap.set("", "<leader>oc", "<cmd>ColorizerToggle<CR>")
end
