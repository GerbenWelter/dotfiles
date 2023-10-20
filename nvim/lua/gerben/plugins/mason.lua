local ensure_installed = {
	"bashls",
	"lua_ls",
}

local tool_ensure_installed = {
	"prettier",
	"stylua",
}

if os.getenv("NVIM_GO") then
	table.insert(ensure_installed, "gopls")
end

if os.getenv("NVIM_HTML") then
	table.insert(ensure_installed, "html")
	table.insert(ensure_installed, "cssls")
end

if os.getenv("NVIM_PYTHON") then
	table.insert(ensure_installed, "jedi_language_server")
	table.insert(tool_ensure_installed, "isort")
	table.insert(tool_ensure_installed, "black")
	table.insert(tool_ensure_installed, "pylint")
end

return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason plugin safely
		local mason = require("mason")

		-- import mason-lspconfig plugin safely
		local mason_lspconfig = require("mason-lspconfig")

		-- automatically install tools
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = ensure_installed,
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = tool_ensure_installed,
		})
	end,
}
