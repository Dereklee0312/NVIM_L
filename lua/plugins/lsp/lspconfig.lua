--==========================================================================================--
--======================================== ON_ATTACH =======================================--
--==========================================================================================--

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

local on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

--==========================================================================================--
--======================================= LSP_CONFIGS ======================================--
--==========================================================================================--

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
		on_attach = on_attach,
		capabilities = capabilities,
	}

	-- server = vim.split(server, "@")[1]
	--
	-- local require_ok, conf_opts = pcall(require, "plugins.lsp.settings." .. server)
	-- if require_ok then
	-- 	opts = vim.tbl_deep_extend("force", conf_opts, opts)
	-- end

	lspconfig[server].setup(opts)
end

lspconfig.tsserver.setup {
  init_options = {
    hostInfo = "neovim",
  },
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function(fname)
    return lspconfig.util.root_pattern "*.js"(fname)
      or lspconfig.util.root_pattern("package.json", "jsconfig.json", ".git")(fname)
  end,
}

--==========================================================================================--
--======================================= DIAGNOSTICS ======================================--
--==========================================================================================--

local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
	-- disable virtual text
	virtual_text = false,
	-- show signs
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
		suffix = "",
	},
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})
