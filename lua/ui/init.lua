local M = {}

local config = {
	statusline = {
		separator_style = "round",
		overriden_modules = nil,
	},
}

M.statusline = function()
	return require("ui.statusline").run()
end


M.setup = function()
	-- lazyload tabufline
	-- vim.opt.statusline = "%{%v:lua.require('ui').statusline()%}"
	vim.opt.statusline = "%!v:lua.require('ui').statusline()"
end

return M
