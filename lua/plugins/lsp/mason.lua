local _, mason = pcall(require, "mason")
if not _ then
	return
end

local servers = {
	-- lua stuff
	"lua-language-server",
	"stylua",

	-- c/cpp
	"clangd",
	"csharp-language-server",

	-- python
	"pyright",

	-- Bash
	"bash-language-server",

	-- Webdev
	"typescript-language-server",
	"emmet-ls",
	"css-lsp",

	-- markdown
	"grammarly-languageserver",

	-- FORMATTERS
	"prettier",
	"prettierd",
	"black",
	"csharpier",
}

local settings = {
	ui = {
		border = "rounded",
		icons = {
			package_pending = " ",
			package_installed = " ",
			package_uninstalled = " ﮊ",
		},
	},
	keymaps = {
		toggle_server_expand = "<CR>",
		install_server = "i",
		update_server = "u",
		check_server_version = "c",
		update_all_servers = "U",
		check_outdated_servers = "C",
		uninstall_server = "X",
		cancel_installation = "<C-c>",
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

vim.api.nvim_create_user_command("MasonInstallAll", function()
	vim.cmd("MasonInstall " .. table.concat(servers, " "))
end, {})

mason.setup(settings)
