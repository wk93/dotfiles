return {
	"nvimdev/guard.nvim",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvimdev/guard-collection",
	},
	config = function()
		local ft = require("guard.filetype")

		ft("lua"):fmt("lsp"):append("stylua"):lint("selene")

		ft("typescript,javascript,typescriptreact"):fmt({
			cmd = "deno",
			args = { "fmt", "-" },
			stdin = true,
		})

		require("guard").setup({
			fmt_on_save = true,
			lsp_as_default_formatter = true,
		})
	end,
}
