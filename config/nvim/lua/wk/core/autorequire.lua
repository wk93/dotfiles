local log = require("wk.core.log")
local M = {}

function M.load_plugin(name)
	local ok, plugin = pcall(require, name)
	if ok then
		vim.validate({ plugin = { plugin, 'function' } })
		return plugin
	end
end

function M.scan_dir(modname)
	local runtimepath = vim.fn.stdpath('config') .. '/lua'
	local dirname = runtimepath .. '/' .. table.concat(vim.split(modname, '.', true), '/')

	local fs, fail = vim.loop.fs_scandir(dirname)

	if fail then
		log.err(fail)
	end

	return fs
end

function M.get_plugins(modname)
	local plugins = {}

	local fs = M.scan_dir(modname)

	local name, fstype = vim.loop.fs_scandir_next(fs)
	while name ~= nil do

		if fstype == 'file' then
			local filename = vim.split(name, '.', true)[1]
			local pluginmod = string.format('%s.%s', modname, filename)
			plugins[pluginmod] = M.load_plugin(pluginmod)
		end

		name, fstype = vim.loop.fs_scandir_next(fs)
	end

	return plugins
end

return M
