local core = require('wk.core')
local options = require('wk.user.options')

core.setup({
	opts = options,
	on_after = function() 
		require('wk.user.keymaps')
	end,
})
