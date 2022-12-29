local M = {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
}

function M.config()
	require("toggleterm").setup({
		size = 100,
		open_mapping = [[<A-i>]],
		direction = "float",
		float_opts = {
			border = "curved",
			winblend = 0,
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},
	})
end

function M.init()
	local Terminal = require("toggleterm.terminal").Terminal
	local _lazygit = Terminal:new({ cmd = "lazygit" })
	local _python = Terminal:new({ cmd = "ipython" })

	---@diagnostic disable-next-line: lowercase-global
	function _lazy_toggle()
		_lazygit:toggle()
	end

	---@diagnostic disable-next-line: lowercase-global
	function _python_toggle()
		_python:toggle()
	end

	function _G.set_terminal_keymaps()
		local opts = { buffer = 0 }
		local map = vim.keymap.set
		map("t", "<C-n>", [[<C-\><C-n>]], opts)
		map("t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
		map("t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
		map("t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
		map("t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
	end

	local nmap = vim.api.nvim_set_keymap
	nmap("", "<A-l>", "<cmd>lua _lazy_toggle()<CR>", { noremap = true, silent = true })
	nmap("", "<A-h>", "<cmd>ToggleTerm size=20 direction=horizontal<CR>", { noremap = true, silent = true })
	nmap("", "<A-i>", "<cmd>ToggleTerm size=100 direction=float<CR>", { noremap = true, silent = true })
	nmap("", "<A-v>", "<cmd>ToggleTerm size=110 direction=vertical<CR>", { noremap = true, silent = true })
	nmap("", "<A-p>", "<cmd>lua _python_toggle()<CR>", { noremap = true, silent = true })
	nmap("v", "<leader>ts", "<cmd> '<,'>ToggleTermSendVisualSelection <CR>", { noremap = true, silent = true })

	-- if you only want these mappings for toggle term use term://*toggleterm#* instead
	vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
end

return M
