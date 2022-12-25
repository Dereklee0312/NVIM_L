local M = {
	"folke/tokyonight.nvim",
	lazy = true,
}

function M.config()
	-- vim.o.background = "dark"
	local tokyonight = require("tokyonight")
	tokyonight.setup({
		style = "storm",
		transparent = true
	})
	tokyonight.load()
end

return M
