return {
	setup = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		require("lspconfig").tsserver.setup({
			capabilities = capabilities,
			root_dir = require("lspconfig.util").root_pattern("package.json"),
		})
	end,
}
