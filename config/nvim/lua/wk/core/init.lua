local M = {}


local log = require("wk.core.log")


local function validate_command(opts)
	vim.validate({
		opts = {opts, 'table'},
		on_after = {opts.on_after, 'function'},
	})
end



function M.setup(opts)
	local ok, errmsg = pcall(validate_command, opts)

	if not ok then
		log.err(errmsg)
		return
	end

	local cmd = require("wk.core.cmd")
	local reload = require("wk.core.reload")

	cmd("ReloadConfig", reload)

	opts.on_after()
end

return M
