local M = {
	"nvim-tree/nvim-tree.lua",
	cmd = {
		"NvimTreeToggle",
		"NvimTreeFocus",
		"NvimTreeFindFile",
		"NvimTreeCollapse"
}
}

function M.config()
	require("nvim-tree").setup({
		diagnostics = {
    enable = true,
    show_on_dirs = false,
    debounce_delay = 50,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  git = {
    enable = true,
    ignore = false,
    show_on_dirs = false,
  },
  renderer = {
    highlight_opened_files = "all",
    icons = {
      show = {
        git = true,
      },
    },
  },
  view = {
    adaptive_size = false,
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  })
  end

  return M
