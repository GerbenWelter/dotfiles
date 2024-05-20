return {
	{
		"bluz71/vim-nightfly-colors",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme nightfly]])
			vim.cmd([[highlight LineNr guibg=#183940]])
		end,
	},
	"talha-akram/noctis.nvim",
	"navarasu/onedark.nvim",
}
