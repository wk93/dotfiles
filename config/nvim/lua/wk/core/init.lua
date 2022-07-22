local M = {}
local log = require("wk.core.log")

local function validate_command(opts)
	vim.validate({
		opts            = { opts, 'table' },
		options         = { opts.opts, 'table' },
		on_after        = { opts.on_after, 'function' },
		config          = { opts.config, 'table' },
		plugins_modname = { opts.config.plugins_modname, 'string' },
		lsp_modname     = { opts.config.lsp_modname, 'string' }
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
	packer(opts.config.plugins_modname)

	local lsp_config = require("wk.core.lsp_config")
	lsp_config.setup(opts.config.lsp_modname)

	opts.on_after()
end

return M
