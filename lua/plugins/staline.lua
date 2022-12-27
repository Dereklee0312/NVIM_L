local M = {
	"tamton-aquib/staline.nvim",
	lazy = false,
}

function M.config()
	require("staline").setup({
		mode_colors = {
			i = "#d4be98",
			n = "#06d6a0",
			c = "#8fbf7f",
			v = "#86bbd8",
		},
		defaults = {
			fg = "#000000",
			true_colors = true,
			left_separator = "",
			right_separator = "",
			line_column = "%l/%L | %c",
			branch_symbol = " ",
		},
		sections = {
			left = {
				"right_sep",
				"-mode",
				"left_sep",
				"right_sep_double",
				"-cwd",
				"-file_name",
				"left_sep_double",
				function()
					if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
						return ""
					end
					local git_status = vim.b.gitsigns_status_dict
					local branch = "%#StGitBranch#  " .. git_status.head
					local added = (git_status.added and git_status.added ~= 0)
							and ("%#StGitAdded#  " .. git_status.added)
						or ""
					local changed = (git_status.changed and git_status.changed ~= 0)
							and ("%#StGitChanged#  " .. git_status.changed)
						or ""
					local removed = (git_status.removed and git_status.removed ~= 0)
							and ("%#StGitRemoved#  " .. git_status.removed)
						or ""
					return branch .. added .. changed .. removed
				end,
			},
			mid = { "lsp" },
			right = { "right_sep_double", "-lsp_name", "left_sep_double", "right_sep", "-line_column", "left_sep" },
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
