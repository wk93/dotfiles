local M = {}


local log = require("wk.core.log")


local function validate_command(opts)
	vim.validate({
		opts = {opts, 'table'},
		opts = {opts.opts, 'table'},
		on_after = {opts.on_after, 'function'},
	})
end

local function assign_options(options)
	vim.g.mapleader = ' '
	for key, value in pairs(options) do
		vim.opt[key] = value
	end

end

function M.setup(opts)
	local ok, errmsg = pcall(validate_command, opts)

	if not ok then
		log.err(errmsg)
		return
	end

	local cmd = require("wk.core.cmd")
	local reload = require("wk.core.reload")

	assign_options(opts.opts)
	cmd("ReloadConfig", reload)

	local packer = require("wk.core.packer")

	opts.on_after()
end

return M
