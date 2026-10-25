local status_ok, cmp = pcall(require, "cmp")
if status_ok then
	cmp.setup.buffer({
		enabled = false,
	})
end
