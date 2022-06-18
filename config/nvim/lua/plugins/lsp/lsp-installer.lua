local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

lsp_installer.on_server_ready(function(server)
  local handlers = require("plugins.lsp.handlers")
  local opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities
  }

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("plugins.lsp.sumenko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server.name == 'tsserver' then
    local tsserver_opts = require("plugins.lsp.tsserver")
    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
  end

  if server.name == 'tailwindcss' then
    local tailwindcss_opts = require("plugins.lsp.tailwindcss")
    opts = vim.tbl_deep_extend("force", tailwindcss_opts, opts)
  end

  server:setup(opts)
end)
