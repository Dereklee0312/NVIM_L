local M = {
	"nvim-treesitter/nvim-treesitter",
	event = "VimEnter"
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
			use_languagetree = true
		},
	})
end

return M
