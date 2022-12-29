local M = {
	"folke/tokyonight.nvim",
	lazy = true,
}

function M.config()
	require("tokyonight").setup({
		-- your configuration comes here
		-- or leave it empty to use the default settings
		style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
		light_style = "day", -- The theme is used when the background is set to light
		transparent = true, -- Enable this to disable setting the background color
		terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
		styles = {
			-- Style to be applied to different syntax groups
			-- Value is any valid attr-list value for `:help nvim_set_hl`
			comments = { italic = true },
			keywords = { italic = true },
			functions = { italic = true, bold = true },
			variables = {},
			-- Background styles. Can be "dark", "transparent" or "normal"
			sidebars = "transparent", -- style for sidebars, see below
			floats = "transparent", -- style for floating windows
		},
		sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
		day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
		hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
		dim_inactive = false, -- dims inactive windows
		lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

		--- You can override specific color groups to use other groups or a hex color
		--- function will be called with a ColorScheme table
		---@param colors ColorScheme
		on_colors = function(colors)
			colors.bg_statusline = "none"
		end,

		--- You can override specific highlights to use other groups or a hex color
		--- function will be called with a Highlights and ColorScheme table
		---@param highlights Highlights
		---@param colors ColorScheme
		on_highlights = function(hl, c)
			local prompt = "#2d3149"
			--=================--
			--=== TELESCOPE ===--
			--=================--
			hl.TelescopeNormal = {
				-- bg = c.bg_dark,
				-- fg = c.fg_dark,
				bg = NONE,
				fg = c.fg_dark,
			}
			hl.TelescopeBorder = {
				-- bg = c.bg_dark,
				-- fg = c.bg_dark,
				bg = NONE,
				fg = c.white,
			}
			hl.TelescopePromptNormal = {
				bg = NONE,
			}
			hl.TelescopePromptBorder = {
				bg = NONE,
				fg = white,
			}
			hl.TelescopePromptTitle = {
				-- bg = prompt,
				bg = NONE,
				fg = c.blue,
			}
			hl.TelescopeTitle = {
				-- bg = prompt,
				bg = NONE,
				fg = c.bg_dark,
			}
			hl.TelescopePreviewTitle = {
				-- bg = c.bg_dark,
				bg = NONE,
				fg = c.red,
			}
			hl.TelescopeResultsTitle = {
				-- bg = c.bg_dark,
				bg = NONE,
				fg = c.purple,
			}

			--=================--
			--==== NVIMTREE ===-s
			--=================--
			hl.NvimTreeWinSeparator = { fg = c.white }
			hl.NvimTreeWindowPicker = {fg = "#a4bef3", bg = NONE}

			--=================--
			--===== BUFFER ====--
			--=================--
			hl.WinSeparator = { fg = c.white }
			hl.BufferInactive = { bg = NONE }
			hl.TabLineFill = { bg = NONE }

			--=================--
			--====== CMP ======--
			--=================--
			hl.Pmenu = { fg = "#7ee8fa", bg = "none" }
			hl.PmenuSbar = { fg = "#8075ff", bg = "none" }

		end,
	})
	vim.cmd("colorscheme tokyonight")
end

return M
