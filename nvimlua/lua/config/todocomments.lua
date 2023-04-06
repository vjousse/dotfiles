local status_ok, todocomments = pcall(require, "todo-comments")
if not status_ok then
	return
end

todocomments.setup({})
