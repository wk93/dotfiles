local lspconfig = require("lspconfig")

local luadev = require("lua-dev").setup({
})

return function()
	lspconfig['sumneko_lua'].setup(luadev)
end
