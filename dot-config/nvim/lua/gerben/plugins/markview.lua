return {
	"OXY2DEV/markview.nvim",
	lazy = false,

	config = function()
		local markview = require("markview")

		markview.setup({
			preview = { enable = false },
		})

		vim.keymap.set("n", "<leader>mvs", ":Markview splitToggle<CR>", { desc = "Toggle Markview split view" })
	end,
}
