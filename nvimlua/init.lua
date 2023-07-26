-- disable netrw at the very start of your init.lua for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local status_ok, bepo = pcall(require, "bepo")
if not status_ok then
	return
end

bepo.setup()

require("config.options")
require("config.keymaps")
require("config.plugins")
require("config.colorscheme")
require("config.cmp")
require("config.indentline")
require("config.lsp")
require("config.telescope")
require("config.treesitter")
require("config.autopairs")
require("config.bufferline")
require("config.gitsigns")
require("config.nvimtree")
require("config.lualine")
require("config.comment")
require("config.todocomments")
require("config.hlargs")
require("config.himalaya")
