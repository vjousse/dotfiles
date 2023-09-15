local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	return
end

comment.setup({
	---LHS of toggle mappings in NORMAL mode
	toggler = {
		---Line-comment toggle keymap
		line = "gy",
		---Block-comment toggle keymap
		block = "gx",
	},
	---LHS of operator-pending mappings in NORMAL and VISUAL mode
	opleader = {
		---Line-comment keymap
		line = "gy",
		---Block-comment keymap
		block = "gx",
	},
})
