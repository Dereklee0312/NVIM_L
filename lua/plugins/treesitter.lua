local M = {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	dependencies = { "p00f/nvim-ts-rainbow", "nvim-treesitter/nvim-treesitter-refactor" },
}

function M.config()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"vim",
			"html",
			"css",
			"javascript",
			"json",
			"markdown",
			"c",
			"bash",
			"lua",
			"python",
			"java",
			"c_sharp",
		},
		sync_install = true,
		auto_install = false,
		highlight = {
			enable = true,
			use_languagetree = true,
		},
		indent = {
			disable = { "python", "javascript" },
		},
		rainbow = {
			enable = true,
			extended_mode = true,
			max_file_lines = nil,
		},
		refactor = {
			smart_rename = {
				enable = true,
				keymaps = {
					smart_rename = "<leader>ra",
				},
			},
			navigation = {
				enable = true,
				keymaps = {
					goto_next_usage = "gnn",
					goto_previous_usage = "gnp",
				},
			},
		},
	})
end

return M
