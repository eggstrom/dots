---Displays a notification describing the option's state
---@param name string The option's name
---@param state boolean The option's state
local function toggle_notify(name, state)
  vim.notify(name .. ": " .. (state and "ON" or "OFF"))
end

---Adds a new toggle mapping
---@param keys string Keys to use after "<leader>t"
---@param name string Name of toggled option
---@param option table Table with 2 elements used to access an option in the vim global
vim.keymap.set_toggle = function(keys, name, option)
  vim.keymap.set("", "<leader>t" .. keys, function()
    local new_state = not vim[option[1]][option[2]]
    vim[option[1]][option[2]] = new_state
    toggle_notify(name, new_state)
  end)
end

---Adds a new toggle mapping
---@param keys string Keys to use after "<leader>t"
---@param name string Name of toggled option
---@param getter function Function used to get the option's current state
---@param setter function Function used to set the option's new state
vim.keymap.set_complex_toggle = function(keys, name, getter, setter)
  vim.keymap.set("", "<leader>t" .. keys, function()
    local new_state = not getter()
    setter(new_state)
    toggle_notify(name, new_state)
  end)
end

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Buffer and tab navigation
vim.keymap.set("", "<Tab>", "<cmd>bnext<CR>")
vim.keymap.set("", "<S-Tab>", "<cmd>bprevious<CR>")

-- Hide search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Open window with diagnostics
vim.keymap.set("", "<leader>d", vim.diagnostic.open_float)

-- Toggle mappings
vim.keymap.set_toggle("n", "Line numbers", { "o", "number" })
vim.keymap.set_toggle("r", "Relative line numbers", { "o", "relativenumber" })
vim.keymap.set_toggle("w", "Wrapping", { "o", "wrap" })
vim.keymap.set_toggle("s", "Spell checking", { "o", "spell" })
vim.keymap.set_complex_toggle("d", "Diagnostics", function()
  return vim.diagnostic.is_enabled()
end, function(state)
  vim.diagnostic.enable(state)
end)
vim.keymap.set_complex_toggle("i", "Inlay hints", function()
  return vim.lsp.inlay_hint.is_enabled()
end, function(state)
  vim.lsp.inlay_hint.enable(state)
end)
