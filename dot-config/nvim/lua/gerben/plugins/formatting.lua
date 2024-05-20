local formatters = {
	json = { "prettier" },
	lua = { "stylua" },
	markdown = { "prettier" },
	sh = { "shfmt" },
	yaml = { "prettier" },
}

if os.getenv("NVIM_GO") then
	table.insert(formatters, 'go = { "goimports", "gofmt" }')
end

if os.getenv("NVIM_PYTHON") then
	table.insert(formatters, 'python = { "isort", "black" }')
end

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = formatters,
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
