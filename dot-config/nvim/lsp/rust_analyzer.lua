-- Workaround for using rust-analyzer on Fedora Silverblue
if vim.fn.filereadable("/lib/sdk/rust-stable/bin/rust-analyzer") == 1 then
	return {
		settings = {
			["rust-analyzer"] = {
				cmd = { "/lib/sdk/rust-stable/bin/rust-analyzer" },
			},
		},
	}
else
	return {}
end
