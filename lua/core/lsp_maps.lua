-- Shorten function name
local map = vim.keymap.set
local opts = { noremap = false, silent = true }
local term_opts = { silent = true }

------------------
--- LSP_CONFIG ---
------------------
map("n", "<leader>f", function()
	vim.diagnostic.open_float({
		focusable = true,
		scope = "line",
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	})
end, opts)

map("n", "<A-e>", "<CMD> Telescope diagnostics <CR>", opts)

map("n", "<leader>fm", function()
	vim.lsp.buf.format { async = true }
end, opts)

map("n", "<leader>ra", function()
	vim.lsp.buf.rename()
end, opts)

map("n", "<leader>ca", function()
	vim.lsp.buf.code_action()
end, opts)

map("n", "K", function()
	vim.lsp.buf.hover()
end, opts)

map("n", "gD", function()
	vim.lsp.buf.declaration()
end, opts)

map("n", "go", function()
	vim.lsp.buf.implementation()
end, opts)

map("n", "<C-k>", function()
	vim.lsp.buf.signature_help()
end, opts)

map("n", "[d", function()
	vim.diagnostic.goto_prev()
end, opts)

map("n", "]d", function()
	vim.diagnostic.goto_next()
end, opts)
