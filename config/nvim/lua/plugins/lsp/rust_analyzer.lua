return {
	setup = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		require("lspconfig").rust_analyzer.setup({
			capabilities = capabilities,
			settings = {
				["rust-analyzer"] = {},
			},
		})
	end,
}
