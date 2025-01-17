vim.g.mapleader = " "

-- Shorten function name
local keymap = vim.keymap.set

-- Silent keymap option
local opts = { silent = true }

keymap("n", "+", "gj", opts)
keymap("n", "-", "gk", opts)

-- When wrap is on, move visible line per visible line
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap("n", "0", "g0", opts)
keymap("n", "$", "g$", opts)

-- Redo
keymap("n", "U", "<C-R>", { silent = true, desc = "Redo" })

-- Easier window navigation
-- Ctrl+g is unused by default https://linux-note.com/vim-raccourcis-clavier/
keymap("n", "<C-g>", "<C-w>w", opts)

keymap("n", "<leader>e", ":NvimTreeFindFileToggle<cr>", opts)
keymap("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
-- <S-r> means capital R (Shift + R)
-- Ergol mapping
keymap("n", "<C-i>", ":bnext<CR>", opts)
keymap("n", "<C-l>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohl<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", ":Bdelete<CR>", opts)

-- Better paste (keep the original copy content when replacing
-- in visual mode, instead of copying the replaced content)
keymap("v", "p", '"_dP', opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down with S and D in visual mode
keymap("v", "<S-r>", ":m .-2<CR>==", opts)
keymap("v", "<S-t>", ":m .+1<CR>==", opts)

-- Move text up and down with S and D in visual block mode
keymap("x", "<S-r>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<S-t>", ":move '<-2<CR>gv-gv", opts)

-- Move text up and down with JK (TS bépo) in visual block mode
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

keymap("n", "<leader>i", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
end)
