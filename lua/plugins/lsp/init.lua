local M = {
	"VonHeikemen/lsp-zero.nvim",
	lazy = false
}

function M.config()
	local lsp = require('lsp-zero')
	lsp.set_preferences({
		suggest_lsp_servers = true,
		setup_servers_on_start = true,
		set_lsp_keymaps = false,
		configure_diagnostics = true,
		cmp_capabilities = true,
		manage_nvim_cmp = true,
		call_servers = 'local',
		sign_icons = {
			error = "",
			warn = "",
			hint = "",
			info = ""
		}
	})
	lsp.setup()
end

return M
