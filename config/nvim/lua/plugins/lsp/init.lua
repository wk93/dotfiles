return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		require("plugins.lsp.lua_ls").setup()
		require("plugins.lsp.rust_analyzer").setup()
		require("plugins.lsp.tsserver").setup()
	end,
}
