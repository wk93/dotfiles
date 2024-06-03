return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("plugins.lsp.lua_ls").setup()
	end,
}
