local M = {}

M.err = function(errmsg)
	vim.notify(errmsg, vim.log.levels.ERROR)
end

M.info = function(infomsg)
	vim.notify(infomsg, vim.log.levels.INFO)
end

return M
