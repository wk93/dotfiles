return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "LspInfo", "LspInstall", "LspUninstall" },
  dependencies = { "folke/neodev.nvim", opts = {} },
  config = function ()
    require("neodev").setup({})

    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup({})

  end
}
