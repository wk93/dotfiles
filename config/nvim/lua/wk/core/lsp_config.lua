local autorequire = require("wk.core.autorequire")
local M = {}

function M.setup(modname)
	local lsp_servers = autorequire.get_plugins(modname)

	for _, plugin in pairs(lsp_servers) do
		plugin()
	end
end

return M
