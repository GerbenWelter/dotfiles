local formatters = {
	json = { "prettier" },
	lua = { "stylua" },
	-- markdown seems to use the formatter 'injected' additionally by default
	-- although 'ConformInfo' doesn't show it
	markdown = { "prettier" },
	sh = { "shfmt" },
	yaml = { "prettier", "injected" },
}

if os.getenv("NVIM_GO") then
	formatters["go"] = { "goimports", "gofmt" }
end

if os.getenv("NVIM_PYTHON") then
	formatters["python"] = { "isort", "black" }
end

if os.getenv("NVIM_RUST") then
	formatters["toml"] = { "taplo" }
end

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	-- Everything in opts will be passed to setup()
	opts = {
		-- Define your formatters
		-- log_level = vim.log.levels.TRACE,
		formatters_by_ft = formatters,
		formatters = {
			injected = {
				options = {
					ignore_errors = false,
				},
			},
			prettier = {
				prepend_args = {
					"--single-quote",
				},
			},
		},
		-- Set up format-on-save
		format_on_save = {
			timeout_ms = 5000,
			lsp_fallback = true,
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
