local log = require("wk.core.log");

local function reload_nvim_config()
	for name, _ in pairs(package.loaded) do
		if name:match('wk') then
			package.loaded[name] = nil
		end
	end

	dofile(vim.env.MYVIMRC)
	log.info("Nvim configuration reloaded")
end

return reload_nvim_config
