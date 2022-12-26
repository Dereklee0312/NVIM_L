local opt = vim.opt

-- Toggle cmd height when writing a command
vim.g.CMDHEIGHT = 0

opt.cmdheight = 0

-- File stuff
opt.undofile = false

-- Searching stuff
opt.iskeyword:append "-" -- consider string-string as whole word
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- Tab stuff
opt.shiftwidth = 4
opt.autoindent = true
opt.smarttab = true
opt.tabstop = 4
opt.softtabstop = 4

-- Line numbers
opt.relativenumber = true

-- Buffer stuff
opt.wrap = false -- No wrap lines
opt.backup = false
opt.scrolloff = 10
opt.sidescrolloff = 20
opt.clipboard = ""
opt.termguicolors = true
opt.signcolumn = 'yes'
