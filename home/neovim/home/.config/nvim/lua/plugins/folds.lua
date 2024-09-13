require("ufo").setup({
    open_fold_hl_timeout = 0,
    provider_selector = function()
        return { "treesitter", "indent" }
    end,
    fold_virt_text_handler = function(virt_text, lnum, end_lnum)
        local new_virt_text = {}
        for _, chunk in ipairs(virt_text) do
            table.insert(new_virt_text, chunk)
        end
        table.insert(new_virt_text, { (" 󰁂 %d"):format(end_lnum - lnum), "MoreMsg" })
        return new_virt_text
    end,
})
