local log = require("wk.core.log")

local function load_plugin(name)
  local ok, plugin = pcall(require, name)
  if ok then
    vim.validate({plugin ={ plugin, 'function'}})
    return plugin
  end
end

local function scan_dir(modname)
  local runtimepath = vim.fn.stdpath('config') .. '/lua'
	local dirname = runtimepath .. '/' .. table.concat(vim.split(modname, '.', true), '/')
	
  local fs, fail = vim.loop.fs_scandir(dirname)

  if fail then
    log.err(fail)
  end

  return fs
end

local function get_plugins(modname)	
	local plugins = {}

  local fs = scan_dir(modname)

  local name, fstype = vim.loop.fs_scandir_next(fs)
  while name ~= nil do
    
    if fstype == 'file' then
      local filename = vim.split(name, '.', true)[1]
      local pluginmod = string.format('%s.%s', modname, filename)
      plugins[pluginmod] = load_plugin(pluginmod)
    end

    name, fstype = vim.loop.fs_scandir_next(fs)
  end

  return plugins
end


local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local function plugins(modname)	
	local all_plugins = get_plugins(modname)
  require('packer').startup(function(use)
		use { 'wbthomason/packer.nvim'}
		use { 'nvim-lua/plenary.nvim' }

		for _, plugin in pairs(all_plugins) do
      plugin(use)
		end	


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
  end)
end

return plugins

