return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"leoluz/nvim-dap-go",
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
		"jbyuki/one-small-step-for-vimkind",
	},
	lazy = false,
	config = function()
		local dap, dapui, dapvt, dapgo =
			require("dap"), require("dapui"), require("nvim-dap-virtual-text"), require("dap-go")
		dapui.setup()
		dapgo.setup()
		dapvt.setup({
			display_callback = function(variable)
				if #variable.value > 15 then
					return " " .. string.sub(variable.value, 1, 15) .. "...  "
				end

				return " " .. variable.value
			end,
		})

		dap.configurations.lua = {
			{
				type = "nlua",
				request = "attach",
				name = "Attach to running Neovim instance",
			},
		}

		dap.adapters.nlua = function(callback, config)
			callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
		end

		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
		vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)

		vim.keymap.set("n", "<leader>dl", function()
			require("osv").launch({ port = 8086 })
		end, { noremap = true })

		vim.keymap.set("n", "<leader>dw", function()
			local widgets = require("dap.ui.widgets")
			widgets.hover()
		end)

		vim.keymap.set("n", "<leader>df", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.frames)
		end)

		-- Eval var under cursor
		vim.keymap.set("n", "<space>?", function()
			dapui.eval(nil, { enter = true })
		end)

		vim.keymap.set("n", "<F1>", dap.continue)
		vim.keymap.set("n", "<F2>", dap.step_into)
		vim.keymap.set("n", "<F3>", dap.step_over)
		vim.keymap.set("n", "<F4>", dap.step_out)
		vim.keymap.set("n", "<F5>", dap.step_back)
		vim.keymap.set("n", "<F13>", dap.restart)

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
