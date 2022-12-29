local M = {
	"navarasu/onedark.nvim",
	lazy = false,
}

function M.config()
	local opts = {
		-- Main options --
		style = "deep", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
		transparent = true, -- Show/hide background
		term_colors = true, -- Change terminal color as per the selected theme style
		ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
		cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

		-- toggle theme style ---
		toggle_style_key = "<leader>tt", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
		toggle_style_list = { "darker", "deep" }, -- List of styles to toggle between

		-- Change code style ---
		-- Options are italic, bold, underline, none
		-- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
		code_style = {
			comments = "italic",
			keywords = "italic",
			functions = "italic,bold",
			strings = "none",
			variables = "none",
		},

		-- Lualine options --
		lualine = {
			transparent = true, -- lualine center bar transparency
		},

		-- Custom Highlights --
		colors = {}, -- Override default colors
		highlights = {
			--=================--
			--===== BUFFER ====--
			--=================--
			BufferInactive = { bg = "none" },
			TabLineFill = { bg = "none" },
			rainbowcol1 = { fg = "#7fefbd" },

			--=================--
			--====== CMP ======--
			--=================--
			Pmenu = { fg = "#7ee8fa", bg = "none" },
			PmenuSbar = { fg = "#8075ff", bg = "none" },
			FloatBorder = { fg = "#7ee8fa", bg = "none" },
			FloatShadow = { bg = "none", pumblend = 0 },
			FloatShadowThrough = { bg = "none", pumblend = 0 },

			--=================--
			--==== NVIMTREE ===--
			--=================--
			NvimTreeWindowPicker = { fg = "#a4bef3", bg = "none" },

			--=================--
			--==== WHICHKEY ===--
			--=================--
			NormalFloat = { bg = "none" },
		}, -- Override highlight groups

		-- Plugins Config --
		diagnostics = {
			darker = true, -- darker colors for diagnostic
			undercurl = true, -- use undercurl instead of underline for diagnostics
			background = true, -- use background color for virtual text
		},
	}
	require("onedark").setup(opts)
	require("onedark").load()
end

return M
