if os.getenv("TERM") ~= "linux" then
    require("catppuccin").setup()
    vim.cmd.colorscheme("catppuccin-mocha")

    local colorizer = require("colorizer")
    colorizer.setup({
        filetypes = {}, -- Disable by default
        user_default_options = {
            css = true, -- Enable all CSS color types
        },
    })

    -- Add colorizer toggle mapping
    vim.keymap.set_complex_toggle("c", "Colorizer", function()
        return colorizer.is_buffer_attached()
    end, function(state)
        if state then
            colorizer.attach_to_buffer()
        else
            colorizer.detach_from_buffer()
        end
    end)
end
