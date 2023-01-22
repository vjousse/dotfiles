local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	return
end

comment.setup({
	---LHS of toggle mappings in NORMAL mode
	toggler = {
		---Line-comment toggle keymap
		line = "gjj",
		---Block-comment toggle keymap
		block = "ghj",
	},
	---LHS of operator-pending mappings in NORMAL and VISUAL mode
	opleader = {
		---Line-comment keymap
		line = "gj",
		---Block-comment keymap
		block = "gh",
	},
})
