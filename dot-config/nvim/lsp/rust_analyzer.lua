if vim.fn.filereadable("/lib/sdk/rust-stable/bin/rust-analyzer") == 1 then
	return {
		vim.lsp.config("rust_analyzer", {
			cmd = { "/lib/sdk/rust-stable/bin/rust-analyzer" },
		}),
	}
end
