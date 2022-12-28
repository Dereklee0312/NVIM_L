local M = {
	"folke/which-key.nvim",
	keys = { "<leader>", '"', "'", "`" },
}

function M.config()
	require("which-key").setup({})
end

return M
