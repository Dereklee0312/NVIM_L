-- Shorten function name
local map = vim.keymap.set
local opts = { noremap = false, silent = true }
local term_opts = { silent = true }

-- Remap space as leader key
map("", "<Space>", "<Nop>", {})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-----------------
-- Normal Mode --
-----------------
-- Navigating to beginning/end of line
map("n", "<C-e>", "$", opts)
map("n", "<C-b>", "^", opts)

map("i","<C-e>", "<End>", opts)
map("i","<C-b>", "<ESC>^i", opts)

-- Move selected line / block of text in visual mode
map("x", "<A-j>", ":move '>+1<CR>gv-gv=gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv-gv=gv", opts)

-- Better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move current line / block with Alt-j/k ala vscode.
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)

-- Navigate splits
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Split screen
map("n", "ss", ":split<CR>", opts)
map("n", "sv", ":vsplit<CR>", opts)

-- Closing windows
map("n", "W", ":q<CR>", opts)
map("n", "<C-s>", ":w<CR>", opts)

-- Remove search highlighting with escape
map("n", "<esc>", "<CMD> noh <CR>", opts)

-- Selecting
map("n", "<C-a>", "gg<S-v>G", opts)
map("n", "YY", "^y$", opts)

-- Yanking
map("n", "x", '"_x', opts)
map("n", "D", '"_d', opts)
map("n", "DD", '"_dd', opts)
map("x", "<leader>p", [["_dP]], opts)

-- buffers
map("n", "<leader>x", "<CMD>bdelete<CR>", opts)

-- Making file executable
map("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true })

-- Incrementing and decrementing numbers
map("n", "+", "<C-a>", opts)
map("n", "-", "<C-x>", opts)

-----------------
--  NVIM_TREE --
-----------------
map("n", "<C-n>", "<CMD> NvimTreeToggle <CR>", opts)

------------------
--- TELESCOPE ---
------------------
map("n", "<A-b>", "<CMD> Telescope buffers <CR>", opts)
map("n", "gr", "<cmd> Telescope lsp_references <CR>", opts, term_opts)
map("n", "gi", "<cmd> Telescope lsp_implementations <CR>", opts, term_opts)
map("n", "gd", "<cmd> Telescope lsp_definitions <CR>", opts, term_opts)
map("n", "<leader>D", "<cmd> Telescope lsp_type_definitions <CR>", opts, term_opts)
map("n", "<leader>tk", "<cmd> Telescope keymaps <CR>", opts, term_opts)
