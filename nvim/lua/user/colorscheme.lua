--local colorscheme = "codedark"
--local colorscheme = "sonokai"
--local colorscheme = "gruvbox"
local colorscheme = "noctis_obscuro"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
