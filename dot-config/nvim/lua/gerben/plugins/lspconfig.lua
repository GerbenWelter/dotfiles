return {
	"neovim/nvim-lspconfig",
	config = function()
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
		}
		vim.diagnostic.config(config)

		vim.lsp.config("*", {})
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					workspace = {
						library = { vim.env.VIMRUNTIME, "${3rd}/luv/library" },
					},
				},
			},
		})

		if os.getenv("NVIM_RUST") then
			if vim.fn.filereadable("/lib/sdk/rust-stable/bin/rust-analyzer") == 1 then
				vim.lsp.config("rust_analyzer", {
					cmd = { "/lib/sdk/rust-stable/bin/rust-analyzer" },
				})
			end
		end
	end,
}
