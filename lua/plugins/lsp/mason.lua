local _, mason = pcall(require, "mason")
if not _ then
	return
end

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

local settings = {
	ui = {
		border = "rounded",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

mason.setup(settings)
