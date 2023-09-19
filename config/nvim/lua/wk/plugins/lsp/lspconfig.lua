return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "LspInfo", "LspInstall", "LspUninstall" },
	dependencies = { { "folke/neodev.nvim", opts = {} }, "hrsh7th/cmp-nvim-lsp" },
	config = function()
		require("neodev").setup({})

		local lspconfig = require("lspconfig")
		local on_attach = function(client, bufnr)
			local opts = { noremap = true, silent = true }
			opts.buffer = bufnr
			local keybinds = {
				["gR"] = { "<cmd>Telescope lsp_references<CR>", "show definition, references" },
				["gD"] = { vim.lsp.buf.declaration, "show definition, references" },
				["gd"] = { "<cmd>Telescope lsp_definitions<CR>", "show lsp definitions" },
				["gi"] = { "<cmd>Telescope lsp_implementations<CR>", "show lsp implementations" },
				["gt"] = { "<cmd>Telescope lsp_type_definitions<CR>", "show lsp type definitions" },
				["<leader>rn"] = { vim.lsp.buf.rename, "smart rename" },
				["<leader>D"] = { "<cmd>Telescope diagnostics bufnr=0<CR>", "show diagnostics for file" },
				["<leader>d"] = { vim.diagnostic.open_float, "show diagnostics for line" },
				["K"] = { vim.lsp.buf.hover, "show documentation for what is under cursor" },
			}
			utils.map("n", keybinds, opts)
		end

		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim", "utils" },
					},
				},
			},
		})
	end,
}
