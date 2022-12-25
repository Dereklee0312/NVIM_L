local M = {
	"tamton-aquib/staline.nvim",
	lazy = false,
}

function M.config()
	require("staline").setup({
		sections = {
			left = { "  ", "mode", " ", "branch", " ", "lsp" },
			mid = { "lsp" },
			right = { "file_name", "line_column" },
		},
		mode_colors = {
			i = "#d4be98",
			n = "#84a598",
			c = "#8fbf7f",
			v = "#fc802d",
		},
		defaults = {
			true_colors = true,
			line_column = " [%l/%L] :%c  ",
			branch_symbol = " ",
		},
	})

	require("stabline").setup({
		style = "slant",
		bg = "#986fec",
		fg = "black",
		stab_right = "",
	})
end

return M
