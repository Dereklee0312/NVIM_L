return {
	--=========== BASICS ===========--
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"abecodes/tabout.nvim",
		event = "InsertEnter",
		config = function ()
			require("tabout").setup()
		end
	},
	--=========== MARKDOWN ===========--
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
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
		config = function()
			require("plugins.lsp.lspconfig")
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
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
			"rafamadriz/friendly-snippets",
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

	-- Copilot
	{
		"github/copilot.vim",
		cmd = { "Copilot" },
		config = function()
			require("plugins.lsp.copilot")
		end,
	},

	--============== WEB ==============--
	{
		"norcalli/nvim-colorizer.lua",
		ft = { "css", "tsx", "html", "jsx", "js", "lua" },
		config = function()
			require("colorizer").setup({
				"*",
				default_options = {
					RGB = true, -- #RGB hex codes
					RRGGBB = true, -- #RRGGBB hex codes
					names = true, -- "Name" codes like Blue
					RRGGBBAA = false, -- #RRGGBBAA hex codes
					rgb_fn = false, -- CSS rgb() and rgba() functions
					hsl_fn = false, -- CSS hsl() and hsla() functions
					css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
					css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
					-- Available modes: foreground, background
					mode = "background", -- Set the display mode.
				},
			})
		end,
	},
}
