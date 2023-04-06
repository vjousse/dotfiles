local status_ok, hlargs = pcall(require, "hlargs")
if not status_ok then
	return
end

hlargs.setup()
