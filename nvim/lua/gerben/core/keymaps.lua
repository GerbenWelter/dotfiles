-- Map key for toggling word wrap
vim.keymap.set("n", "<leader>z", ":set wrap!<CR>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Create function and keymaps for toggling all columns
-- for easier copy/paste.
function _G.toggle_columns()
	require("indent_blankline.commands").toggle("IndentBlanklineToggle")
	vim.wo.number = not vim.wo.number
	if vim.wo.signcolumn == "yes" then
		vim.wo.signcolumn = "no"
	else
		vim.wo.signcolumn = "yes"
	end
end

vim.keymap.set("n", "<S-F5>", ":lua toggle_columns()<CR>")
vim.keymap.set("n", "<F17>", ":lua toggle_columns()<CR>")
