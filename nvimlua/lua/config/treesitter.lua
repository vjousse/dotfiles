local status_ok, _ = pcall(require, "nvim-treesitter")
if not status_ok then
	return
end

local _, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
  ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python", "graphql", "javascript", "rasi", "rust", "typescript", "vim", "yaml", "svelte", "rst", "html", "json", "gitignore", "dockerfile" }, -- put the language you want in this array
  -- ensure_installed = "all", -- one of "all" or a list of languages
	ignore_install = { "" }, -- List of parsers to ignore installing
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  highlight = {
		enable = true, -- false will disable the whole extension
		disable = { }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { } },

	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
})
