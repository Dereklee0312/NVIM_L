local M = {
	"VonHeikemen/lsp-zero.nvim",
	lazy = false
}

function M.config()
	local lsp = require('lsp-zero')
	lsp.preset('recommended')
	lsp.setup()
end

return M
