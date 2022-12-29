local M = {
	"folke/which-key.nvim",
	keys = { "<leader>", '"', "'", "`" },
}

function M.config()
	vim.g.COPILOT = 0

	-- Function to toggle github copilot plugin
	local function _toggle_copilot()
		if vim.g.COPILOT == 0 then
			vim.notify("ENABLED COPILOT")
			vim.cmd("Copilot enable")
			vim.g.COPILOT = 1
		else
			vim.notify("DISABLED COPILOT")
			vim.cmd("Copilot disable")
			vim.g.COPILOT = 0
		end
	end

	require("which-key").setup({})
	local wk = require("which-key")

	wk.register({
		["<leader>ts"] = { "<cmd>ToggleTermSendVisualSelection<CR><cmd>ToggleTerm<CR>", "Send Lines to Terminal" },
	}, { mode = "v" })

	wk.register({
		["<leader>ts"] = { "<cmd>ToggleTermSendCurrentLine<CR><cmd>ToggleTerm<CR>", "Send CURRENT line to Terminal" },
		["<leader>g"] = {
			name = "+ Git ﴣ",
			d = { "<CMD> Gitsigns toggle_deleted <CR>", "Toggle Delete" },
			b = { "<CMD> Gitsigns blame_line <CR>", "Toggle Git Blame" },
			c = { _toggle_copilot, "Toggle Copilot" },
		},
	})
end

return M
