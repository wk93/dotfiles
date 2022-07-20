local log = require("wk.core.log")


local function validate_command(name, command, opts)
	vim.validate({
		name = {name, 'string'},
		command = {command, {'string', 'function'}},

		opts = {opts, {'table'}, true}
	})
end



local function cmd(name, command, opts)
	local ok, errmsg = pcall(validate_command, name, command, opts)

	if not ok then
		log.err(errmsg)
		return
	end

	opts = opts or {}

	ok, errmsg = pcall(vim.api.nvim_create_user_command, name, command, opts)

	if not ok then
		log.err(errmsg)
	end

end


return cmd
