return {
	--=========== BASICS ===========--
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = function()
			require("Comment").setup()
		end,
	},

	--=========== SCHEMES ===========--
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		config = function()
			require("nvim-web-devicons").setup()
		end,
	},

	--=========== BUFFER GOODIES ===========-
	{
		"dstein64/vim-startuptime",
		cmd = { "StartupTime" },
	},
	-- {
	-- 	"NvChad/ui",
	-- 	lazy = false,
	-- 	config = function()
	-- 		require("ui").setup()
	-- 	end,
	-- },

	--============== LSP ==============--
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		-- event = "VeryLazy",
		config = function()
			require("plugins.lsp.lspconfig")
			require("plugins.lsp.attach")
			require("plugins.lsp.diagnostics")
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		-- event = "VeryLazy",
		-- dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("plugins.lsp.mason")
		end,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-cmdline",
		},
		config = function()
			require("plugins.lsp.cmp")
		end,
	},

	-- Snippets
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",

	-- Formatting
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.lsp.null")
		end,
	},
}
