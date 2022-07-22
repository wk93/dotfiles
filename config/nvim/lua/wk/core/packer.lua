local log = require("wk.core.log")
local autorequire = require("wk.core.autorequire");

local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

local function plugins(modname)
	local all_plugins = autorequire.get_plugins(modname)
	require('packer').startup(function(use)
		use { 'wbthomason/packer.nvim' }
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
