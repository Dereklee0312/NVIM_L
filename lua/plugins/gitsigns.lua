local M = {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
	-- lazy = false
}

function M.config()
	-- local options = {
	-- 	signs = {
	-- 		add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
	-- 		change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
	-- 		delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
	-- 		topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
	-- 		changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
	-- 	},
	-- }
	-- require("gitsigns").setup(options)
	require("gitsigns").setup()
end

return M
