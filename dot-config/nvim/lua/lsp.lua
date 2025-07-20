local config = {
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		source = true,
		header = "",
		prefix = "",
		suffix = "",
	},
	virtual_text = {
		current_line = true,
		source = true,
	},
}
vim.diagnostic.config(config)

-- keymappings
vim.keymap.set(
	"n",
	"<leader>df",
	"<cmd>lua vim.diagnostic.open_float()<CR>",
	{ desc = "shows diagnostics in floating window" }
)
vim.keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "goto definition" })
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "goto definition" })

-- This enables code completion using LSP
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- lua/lsp.lua (Main LSP setup file)
-- Define global LSP settings using vim.lsp.config('*', ...)
-- These apply to ALL language servers unless overridden.
vim.lsp.config("*", {
	capabilities = capabilities,
	flags = {
		-- Debounce settings can improve performance
		debounce_text_changes = 150,
	},
	-- Example: Define common on_attach or capabilities here if desired
})

-- Initialize lspconfig to add its configurations to the runtime path
require("lspconfig")
