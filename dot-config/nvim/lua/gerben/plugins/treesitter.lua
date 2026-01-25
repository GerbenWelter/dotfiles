return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		branch = "main",
		config = function()
			local ensure_installed = {
				"bash",
				"comment",
				"dockerfile",
				"gitignore",
				"go",
				"gomod",
				"gosum",
				"gotmpl",
				"gowork",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"sql",
				"query",
				"vim",
				"yaml",
			}
			require("nvim-treesitter").install(ensure_installed)

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("tree-sitter-enable", { clear = true }),
				callback = function(args)
					local lang = vim.treesitter.language.get_lang(args.match)
					if not lang then
						return
					end

					if vim.treesitter.query.get(lang, "highlights") then
						vim.treesitter.start(args.buf)
					end

					if vim.treesitter.query.get(lang, "indents") then
						vim.opt_local.indentexpr = 'v:lua.require("nvim-treesitter").indentexpr()'
					end
				end,
			})
		end,
	},
}
