local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	debug = false,
	-- Add on save auto formatting
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format()
				end,
			})
		end
	end,
	sources = {
		formatting.prettier.with({
			--extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"jsonc",
				"yaml",
				"markdown",
				"markdown.mdx",
				"graphql",
				"handlebars",
				"svelte",
			},
		}),
		formatting.isort,
		formatting.stylua,
		formatting.elm_format,
		--diagnostics.flake8.with({ extra_args = { "--ignore=E501,W503", "--max-line-length=88" } }),
		-- For whatever reason I can't get pylint to work, it doesn't take into account my virtualenvs
		-- Using flake8 instead
		--diagnostics.pylint.with({ extra_args = { "--disable=C0114,C0115,C0116" } }),
	},
})
