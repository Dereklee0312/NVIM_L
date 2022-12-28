local M = {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	dependencies = { "p00f/nvim-ts-rainbow" },
}

function M.config()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"bash",
			"python",
			"lua",
		},
		sync_install = true,
		auto_install = false,
		highlight = {
			enable = true,
			use_languagetree = true,
		},
		rainbow = {
			enable = true,
			extended_mode = true,
			max_file_lines = nil,
		},
	})
end

return M
