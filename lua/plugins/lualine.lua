local M = {
	"nvim-lualine/lualine.nvim",
	-- enabled = false,
	lazy = false,
}

function M.config()
	require("lualine").setup({
		sections = {
			lualine_b = { { "b:gitsigns_head", icon = "" } },
		},
	})
end

return M
