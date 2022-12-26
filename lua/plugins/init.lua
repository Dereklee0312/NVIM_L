return {
	--=========== BASICS ===========--
	"nvim-lua/plenary.nvim",

	--=========== SCHEMES ===========--
	"catppuccin/nvim",
	"folke/tokyonight.nvim",
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		config = function ()
			require("nvim-web-devicons").setup()
		end
	},

	--=========== BUFFER GOODIES ===========-
	"nvim-treesitter/nvim-treesitter",
	"nvim-telescope/telescope.nvim",
	{
		"NvChad/ui",
		lazy = false,
		config = function()
			require("ui").setup()
		end
	},

	--=========== GITSIGNS ===========--
	'lewis6991/gitsigns.nvim',

	--============== LSP ==============--
	'VonHeikemen/lsp-zero.nvim',

    -- LSP Support
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Autocompletion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',

    -- Snippets
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
}
