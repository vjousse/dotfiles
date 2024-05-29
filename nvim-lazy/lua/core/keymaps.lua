vim.g.mapleader = " "

-- Shorten function name
local keymap = vim.keymap.set

-- Silent keymap option
local opts = { silent = true }

-- Taken from https://github.com/cljoly/bepo.nvim/blob/main/lua/bepo.lua
local function map_text_object(key, target)
	vim.api.nvim_set_keymap("o", key, target, { noremap = true })
	vim.api.nvim_set_keymap("x", key, target, { noremap = true })
	return nil
end
local function map_normal(key, target)
	vim.api.nvim_set_keymap("n", key, target, { noremap = true })
	return nil
end
local function map_all(key, target)
	map_normal(key, target)
	return map_text_object(key, target)
end
-- Bépo mappings
-- Movements
map_all("c", "h")
map_all("t", "j")
map_all("s", "k")
map_all("r", "l")
map_all("C", "H")
map_all("T", "J")
map_all("S", "K")
map_all("R", "L")
map_all("gt", "gj")
map_all("gs", "gk")
map_all("zT", "zt")
map_all("zt", "zj")
map_all("zk", "zs")
map_all("zs", "zk")
map_all("h", "t")
map_all("H", "T")
map_all("l", "c")
map_all("L", "C")
map_all("j", "r")
map_all("J", "R")
map_all("k", "s")
map_all("K", "S")

--Window
map_normal("w", "<C-w>")
map_normal("W", "<C-w><C-w>")
map_normal("wc", "<C-w>h")
map_normal("wt", "<C-w>j")
map_normal("ws", "<C-w>k")
map_normal("wr", "<C-w>l")
map_normal("wC", "<C-w>H")
map_normal("wT", "<C-w>J")
map_normal("wS", "<C-w>K")
map_normal("wR", "<C-w>L")
map_normal("wh", "<C-w>s")
map_normal("w\195\169", "<C-w>t")
map_normal("w\195\137", "<C-w>T")

-- When wrap is on, move visible line per visible line
keymap("n", "t", "gj", opts)
keymap("n", "s", "gk", opts)
keymap("n", "0", "g0", opts)
keymap("n", "$", "g$", opts)

-- Redo
keymap("n", "U", "<C-R>", opts)

-- Better window navigation
-- Bépo mapping
keymap("n", "<C-c>", "<C-w>h", opts)
keymap("n", "<C-t>", "<C-w>j", opts)
keymap("n", "<C-s>", "<C-w>k", opts)
keymap("n", "<C-r>", "<C-w>l", opts)

keymap("n", "<leader>e", ":NvimTreeFindFileToggle<cr>", opts)
keymap("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>", opts)

-- Close window with Ctrl+a (bépo, q in azerty)
keymap("n", "<C-a>", "<C-w>c", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Clear highlights
-- Bépo mapping
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
-- Bépo mapping
keymap("n", "<S-q>", ":Bdelete<CR>", opts)

-- Better paste (keep the original copy content when replacing
-- in visual mode, instead of copying the replaced content)
-- Bépo mapping
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press éé (bepo) fast to escape
keymap("i", "éé", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down with S and D in visual mode
keymap("v", "<S-d>", ":m .-2<CR>==", opts)
keymap("v", "<S-s>", ":m .+1<CR>==", opts)

-- Move text up and down with S and D in visual block mode
keymap("x", "<S-s>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<S-d>", ":move '<-2<CR>gv-gv", opts)

-- Move text up and down with JK (TS bépo) in visual block mode
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
