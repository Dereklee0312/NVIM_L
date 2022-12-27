local modes = {
	["n"] = { "NORMAL", "St_NormalMode" },
	["niI"] = { "NORMAL i", "St_NormalMode" },
	["niR"] = { "NORMAL r", "St_NormalMode" },
	["niV"] = { "NORMAL v", "St_NormalMode" },
	["no"] = { "N-PENDING", "St_NormalMode" },
	["i"] = { "INSERT", "St_InsertMode" },
	["ic"] = { "INSERT (completion)", "St_InsertMode" },
	["ix"] = { "INSERT completion", "St_InsertMode" },
	["t"] = { "TERMINAL", "St_TerminalMode" },
	["nt"] = { "NTERMINAL", "St_NTerminalMode" },
	["v"] = { "VISUAL", "St_VisualMode" },
	["V"] = { "V-LINE", "St_VisualMode" },
	["Vs"] = { "V-LINE (Ctrl O)", "St_VisualMode" },
	[""] = { "V-BLOCK", "St_VisualMode" },
	["R"] = { "REPLACE", "St_ReplaceMode" },
	["Rv"] = { "V-REPLACE", "St_ReplaceMode" },
	["s"] = { "SELECT", "St_SelectMode" },
	["S"] = { "S-LINE", "St_SelectMode" },
	[""] = { "S-BLOCK", "St_SelectMode" },
	["c"] = { "COMMAND", "St_CommandMode" },
	["cv"] = { "COMMAND", "St_CommandMode" },
	["ce"] = { "COMMAND", "St_CommandMode" },
	["r"] = { "PROMPT", "St_ConfirmMode" },
	["rm"] = { "MORE", "St_ConfirmMode" },
	["r?"] = { "CONFIRM", "St_ConfirmMode" },
	["!"] = { "SHELL", "St_TerminalMode" },
}

local function mode()
	local m = vim.api.nvim_get_mode().mode
	local current_mode = " " .. modes[m][1]
	return current_mode
end

local function git_branch()
	if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
		return ""
	end
	local git_status = vim.b.gitsigns_status_dict
	local branch = "  " .. git_status.head
	return branch
end

local function git_add()
	if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
		return ""
	end
	local git_status = vim.b.gitsigns_status_dict
	local added = (git_status.added and git_status.added ~= 0) and ("  " .. git_status.added) or ""
	return added
end

local function git_change()
	if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
		return ""
	end
	local git_status = vim.b.gitsigns_status_dict
	local changed = (git_status.changed and git_status.changed ~= 0) and ("  " .. git_status.changed) or ""
	return changed
end

local function git_delete()
	if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
		return ""
	end
	local git_status = vim.b.gitsigns_status_dict
	local removed = (git_status.removed and git_status.removed ~= 0) and ("  " .. git_status.removed) or ""
	return removed
end

local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
}

function M.config()
	local git_status = vim.b.gitsigns_status_dict
	if vim.g.started_by_firenvim then
		return
	end

	require("lualine").setup({
		options = {
			theme = "auto",
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			icons_enabled = true,
			globalstatus = true,
			disabled_filetypes = { statusline = { "dashboard", "lazy" } },
		},
		sections = {
			lualine_a = { { mode, separator = { left = "", right = "" } } },
			lualine_b = { "branch" },
			lualine_c = {
				{ "diagnostics", sources = { "nvim_diagnostic" } },
				{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
				{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
				{
					function()
						local navic = require("nvim-navic")
						local ret = navic.get_location()
						return ret:len() > 2000 and "navic error" or ret
					end,
					cond = function()
						if package.loaded["nvim-navic"] then
							local navic = require("nvim-navic")
							return navic.is_available()
						end
					end,
					color = { fg = "#ff9e64" },
				},
			},
			lualine_x = {
				{ git_branch, color = { fg = "#9792e3" }, separator = "", padding = { left = 0, right = 0 } },
				{
					git_add,
					color = { fg = "#61e786" },
					separator = "",
					padding = { left = 0, right = 0 },
					cond = function()
						if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
							return false
						else
							return true
						end
					end,
				},
				{
					git_change,
					color = { fg = "#ffd972" },
					separator = "",
					padding = { left = 0, right = 0 },
					cond = function()
						if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
							return false
						else
							return true
						end
					end,
				},
				{
					git_delete,
					color = { fg = "#d9594c" },
					separator = "",
					padding = { left = 0, right = 1 },
					cond = function()
						if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
							return false
						else
							return true
						end
					end,
				},

				-- {
				--   require("noice").api.status.message.get_hl,
				--   cond = require("noice").api.status.message.has,
				-- },
				-- {
				-- 	function()
				-- 		return require("noice").api.status.command.get()
				-- 	end,
				-- 	cond = function()
				-- 		if package.loaded["noice"] then
				-- 			return require("noice").api.status.command.has()
				-- 		end
				-- 	end,
				-- 	color = { fg = "#ff9e64" },
				-- },
				-- {
				-- 	function()
				-- 		return require("noice").api.status.mode.get()
				-- 	end,
				-- 	cond = function()
				-- 		if package.loaded["noice"] then
				-- 			return require("noice").api.status.mode.has()
				-- 		end
				-- 	end,
				-- 	color = { fg = "#ff9e64" },
				-- },
				-- {
				-- 	function()
				-- 		return require("noice").api.status.search.get()
				-- 	end,
				-- 	cond = function()
				-- 		if package.loaded["noice"] then
				-- 			return require("noice").api.status.search.has()
				-- 		end
				-- 	end,
				-- 	color = { fg = "#ff9e64" },
				-- },
				-- {
				-- 	function()
				-- 		return require("lazy.status").updates()
				-- 	end,
				-- 	cond = require("lazy.status").has_updates,
				-- 	color = { fg = "#ff9e64" },
				-- },
				-- function()
				--   return require("messages.view").status
				-- end,
				-- {
				-- 	function()
				-- 		return require("util.dashboard").status()
				-- 	end,
				-- },
			},
			lualine_y = { "location" },
			lualine_z = { { "progress", separator = { right = "" } } },
			-- lualine_z = { { clock, separator = { right = "" } } },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		-- winbar = {
		--   lualine_a = {},
		--   lualine_b = {},
		--   lualine_c = { "filename" },
		--   lualine_x = {},
		--   lualine_y = {},
		--   lualine_z = {},
		-- },
		--
		-- inactive_winbar = {
		--   lualine_a = {},
		--   lualine_b = {},
		--   lualine_c = { "filename" },
		--   lualine_x = {},
		--   lualine_y = {},
		--   lualine_z = {},
		-- },
	})
end

return M
