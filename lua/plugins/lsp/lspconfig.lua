local servers = {
	-- LUA
	"sumneko_lua",

	-- C
	"clangd",
	"csharp_ls",

	-- python
	"pyright",

	-- Bash
	"bashls",

	-- HTML & CSS
	"emmet_ls",
	"cssls",

	-- Markdown
	"grammarly",
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("plugins.lsp.attach").on_attach,
		capabilities = require("plugins.lsp.attach").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "plugins.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
