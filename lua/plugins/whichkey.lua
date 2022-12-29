local M = {
	"folke/which-key.nvim",
	keys = { "<leader>", '"', "'", "`" },
}

function M.config()
	require("which-key").setup({})
	local wk = require("which-key")

	wk.register({
		["<leader>ts"] = { "<cmd>ToggleTermSendVisualSelection<CR><cmd>ToggleTerm<CR>", "Send Lines to Terminal" },
	}, { mode = "v" })

	wk.register({
		["<leader>ts"] = { "<cmd>ToggleTermSendCurrentLine<CR><cmd>ToggleTerm<CR>", "Send CURRENT line to Terminal" },
	})
end

return M
