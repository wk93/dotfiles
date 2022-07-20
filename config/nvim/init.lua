local core = require('wk.core')
core.setup({
	on_after = function() 
		require('wk.user.keymaps')
	end,
})
