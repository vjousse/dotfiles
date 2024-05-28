vim.g.mapleader = " "

-- Shorten function name
local keymap = vim.keymap.set

-- Silent keymap option
local opts = { silent = true }

-- Bépo mappings
-- Movements
keymap("n", "c", "h", { noremap = true })
keymap("n", "t", "j", { noremap = true })
keymap("n", "s", "k", { noremap = true })
keymap("n", "r", "l", { noremap = true })
keymap("n", "C", "H", { noremap = true })
keymap("n", "T", "J", { noremap = true })
keymap("n", "S", "K", { noremap = true })
keymap("n", "R", "L", { noremap = true })
keymap("n", "gt", "gj", { noremap = true })
keymap("n", "gs", "gk", { noremap = true })
keymap("n", "zT", "zt", { noremap = true })
keymap("n", "zt", "zj", { noremap = true })
keymap("n", "zk", "zs", { noremap = true })
keymap("n", "zs", "zk", { noremap = true })
keymap("n", "h", "t", { noremap = true })
keymap("n", "H", "T", { noremap = true })
keymap("n", "l", "c", { noremap = true })
keymap("n", "L", "C", { noremap = true })
keymap("n", "j", "r", { noremap = true })
keymap("n", "J", "R", { noremap = true })
keymap("n", "k", "s", { noremap = true })
keymap("n", "K", "S", { noremap = true })

--Window
keymap("n", "w", "<C-w>", { noremap = true })
keymap("n", "W", "<C-w><C-w>", { noremap = true })
keymap("n", "wc", "<C-w>h", { noremap = true })
keymap("n", "wt", "<C-w>j", { noremap = true })
keymap("n", "ws", "<C-w>k", { noremap = true })
keymap("n", "wr", "<C-w>l", { noremap = true })
keymap("n", "wC", "<C-w>H", { noremap = true })
keymap("n", "wT", "<C-w>J", { noremap = true })
keymap("n", "wS", "<C-w>K", { noremap = true })
keymap("n", "wR", "<C-w>L", { noremap = true })
keymap("n", "wh", "<C-w>s", { noremap = true })
keymap("n", "w\195\169", "<C-w>t", { noremap = true })
keymap("n", "w\195\137", "<C-w>T", { noremap = true })

-- When wrap is on, move visible line per visible line
keymap("n", "t", "gj", opts)
keymap("n", "s", "gk", opts)
keymap("n", "0", "g0", opts)
keymap("n", "$", "g$", opts)

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
