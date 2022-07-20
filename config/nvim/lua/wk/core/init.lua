local M = {}

function M.setup()
	local cmd = require("wk.core.cmd")
	local reload = require("wk.core.reload")

	cmd("ReloadConfig", reload)
end

return M
