local M = {
	"noib3/nvim-cokeline",
	event = "BufAdd",
}

function M.config()
	local get_hex = require("cokeline/utils").get_hex

	require("cokeline").setup({
		show_if_buffers_are_at_least = 2,
		sidebar = {
			filetype = "NvimTree",
			components = {
				{
					text = "  NvimTree",
					fg = "#93b7be",
					bg = get_hex("NvimTreeNormal", "bg"),
					style = "bold",
				},
			},
		},
		buffers = {
			focus_on_delete = "prev",
		},

		default_hl = {
			fg = function(buffer)
				return buffer.is_focused and get_hex("Normal", "fg") or get_hex("Comment", "fg")
			end,
			bg = get_hex("ColorColumn", "bg"),
		},

		components = {
			{
				text = " ",
				bg = get_hex("Normal", "bg"),
			},
			{
				text = "",
				fg = get_hex("ColorColumn", "bg"),
				bg = get_hex("Normal", "bg"),
			},
			{
				text = function(buffer)
					return buffer.devicon.icon
				end,
				fg = function(buffer)
					return buffer.devicon.color
				end,
			},
			{
				text = " ",
			},
			{
				text = function(buffer)
					return buffer.filename .. "  "
				end,
				style = function(buffer)
					return buffer.is_focused and "bold" or nil
				end,
			},
			{
				-- text = "",
				-- delete_buffer_on_left_click = true,
				text = function(buffer)
					return buffer.is_modified and "●" or ""
				end,
				fg = function(buffer)
					return buffer.is_modified and "#F28FAD" or "#B5E8E0"
				end,
				delete_buffer_on_left_click = true,
				truncation = { priority = 1 },
			},
			{
				text = "",
				fg = get_hex("ColorColumn", "bg"),
				bg = get_hex("Normal", "bg"),
			},
		},
	})
end

function M.init()
	local map = vim.keymap.set
	map("n", "<S-Tab>", "<Plug>(cokeline-focus-prev)", { silent = true })
	map("n", "<Tab>", "<Plug>(cokeline-focus-next)", { silent = true })
end

return M
