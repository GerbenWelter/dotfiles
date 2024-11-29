-- Map key for toggling word wrap
vim.keymap.set("n", "<leader>z", ":set wrap!<CR>", { silent = true })

-- Create function and keymaps for toggling all columns
-- for easier copy/paste.
function _G.toggle_columns()
	vim.cmd("IBLToggle")
	vim.wo.number = not vim.wo.number
	if vim.wo.signcolumn == "yes" then
		vim.wo.signcolumn = "no"
	else
		vim.wo.signcolumn = "yes"
	end
end

vim.keymap.set("n", "<S-F5>", ":lua toggle_columns()<CR>")
vim.keymap.set("n", "<F17>", ":lua toggle_columns()<CR>")

vim.keymap.set("n", "<C-j>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<C-k>", ":BufferLineCycleNext<CR>")

vim.keymap.set("n", "<S-C-j>", ":BufferLineMovePrev<CR>")
vim.keymap.set("n", "<S-C-k>", ":BufferLineMoveNext<CR>")

vim.keymap.set("i", "<C-s>", "<Esc>:write<CR>li")
vim.keymap.set("n", "<C-s>", ":write<CR>")

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- toggle inlay hints
if vim.lsp.inlay_hint then
	vim.keymap.set("n", "<leader>uh", function()
		vim.lsp.inlay_hint(0, nil)
	end, { desc = "Toggle Inlay Hints" })
end
