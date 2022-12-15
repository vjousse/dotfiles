-- disable netrw at the very start of your init.lua for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require "config.options"
require "config.keymaps"
require "config.plugins"
require "config.colorscheme"
require "config.cmp"
require "config.lsp"

require("nvim-tree").setup()
