require("lualine").setup({
    options = {
        globalstatus = true,
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
    },
    tabline = {
        lualine_a = {
            {
                "buffers",
                use_mode_colors = true,
                symbols = { modified = " [+]" },
                buffers_color = { inactive = "StatusLine" },
            },
        },
        lualine_z = {
            {
                "tabs",
                use_mode_colors = true,
                symbols = { modified = " [+]" },
                tabs_color = { inactive = "StatusLine" },
            },
        },
    },
})
