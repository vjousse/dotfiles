-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

--Bepo/Azerty langmap
-- vim.cmd(
-- 	[[set langmap=ba,éz,pe,or,èt,çy,vu,di,lo,jp,w$,z^,aq,us,id,ef,\\,g,ch,tj,sk,rl,nm,mù,^*,ê<,àw,yx,xc,.v,kb,'n,q\\,,g\\;,h:,f!,BA,ÉZ,PE,OR,ÈT,ÇY,VU,DI,LO,FP,JP,Z£,AQ,US,ID,EF,?G,CH,TJ,SK,RL,NM,M%,!*,Ê>,ÀW,YX,XC,:V,KB,\\;G,QG,G.,H/,F§,@œ,_&,"é,«",»',((,)-,+è,-_,*ç,/à,=),%=,$Œ,^°,µ+,#“,{´,}~,<#,>{,\[\[,\]|,±`,¬\,×^,÷@,¯\],%}ba,éz,pe,or,èt,çy,vu,di,lo,jp,z^,aq,us,id,ef,\\,g,ch,tj,sk,rl,nm,mù,^*,ê<,yx,xc,.v,kb,'n,q\\,,g\\;,h:,f!,BA,ÉZ,PE,OR,ÈT,ÇY,VU,DI,LO,FP,JP,Z£,AQ,US,ID,EF,?G,CH,TJ,SK,RL,NM,M%,!*,Ê>,ÀW,YX,XC,:V,KB,\\;N,QG,G.,H/,F§,@œ,_&,"é,«",»',((,)-,+è,-_,*ç,/à,=),%=,$Œ,^°,µ+,#“,{´,}~,<#,>{,\[\[,\]|,±`,¬\,×^,÷@,¯\],%}]]
-- )
--
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

-- When wrap is on, move visible line per visible line
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
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

-- Navigate buffers
-- <S-r> means capital R (Shift + R)
-- Bépo mapping
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

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

local builtin = require("telescope.builtin")
keymap("n", "<leader>ff", builtin.find_files, {})
keymap("n", "<leader>fg", builtin.live_grep, {})
keymap("n", "<leader>fb", builtin.buffers, {})
keymap("n", "<leader>fh", builtin.help_tags, {})

-- Formatting
keymap("n", "<leader>fd", ":Format<cr>", opts)
