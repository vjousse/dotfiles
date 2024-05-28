local status_ok, _ = pcall(require, "nvim-treesitter")
if not status_ok then
	return
end

local _, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = {
		"bash",
		"dockerfile",
		"gitignore",
		"graphql",
		"haskell",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"python",
		"rasi",
		"rst",
		"rust",
		"svelte",
		"typescript",
		"vim",
		"yaml",
	}, -- put the language you want in this array
	-- ensure_installed = "all", -- one of "all" or a list of languages
	ignore_install = { "" }, -- List of parsers to ignore installing
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = {}, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = {} },
})

require("ts_context_commentstring").setup({
	enable_autocmd = false,
	languages = {
		typescript = "// %s",
	},
})
