return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-b>"] = function(prompt_bufnr)
							-- Safely require the action state module inside the callback
							local action_state = require("telescope.actions.state")
							local current_picker = action_state.get_current_picker(prompt_bufnr)

							-- Safely look through selected entries or grab everything if nothing is marked
							local selections = current_picker:get_multi_selection()
							if vim.tbl_isempty(selections) then
								table.insert(selections, action_state.get_selected_entry())
							end

							-- Add files to the Neovim buffer list
							for _, entry in ipairs(selections) do
								if entry and (entry.path or entry.filename) then
									local path = entry.path or entry.filename
									vim.cmd("badd " .. vim.fn.fnameescape(path))
								end
							end

							actions.close(prompt_bufnr)
							print("Selected files added to buffer list!")
						end,
					},
				},
				file_ignore_patterns = { "vendor" },
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
	end,
}
