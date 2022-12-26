local M = {
	"williamboman/mason.nvim",
	cmd = {"Mason"},
	dependencies = {
	"williamboman/mason-lspconfig.nvim",
}
}

function M.config()
	require("mason").setup()
end

return M
