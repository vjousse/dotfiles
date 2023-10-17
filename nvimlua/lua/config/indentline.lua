local status_ok, indent_blankline = pcall(require, "ibl")
if not status_ok then
	return
end

indent_blankline.setup()
