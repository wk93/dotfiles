return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "LspInfo", "LspInstall", "LspUninstall" },
  dependencies = { "folke/neodev.nvim", opts = {} },
  config = function()
    require("neodev").setup({})

    local lspconfig = require("lspconfig")

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

    utils.map("n", keybinds)

    lspconfig.lua_ls.setup({})
  end,
}
