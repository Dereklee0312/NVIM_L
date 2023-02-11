local M = {
	"folke/todo-comments.nvim",
	event = "VeryLazy",
}

function M.config()
	require("todo-comments").setup({})
end

return M
