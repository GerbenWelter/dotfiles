local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Keymaps
keymap('n', '<F5>', ':set nonumber! number?<CR>', opts)
keymap('n', '<F24>', ':PackerSync<CR>', opts)
keymap('n', '<c-n>', ':NeoTreeFocusToggle<CR>', opts)

