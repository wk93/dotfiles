local status_ok, configs = pcall(require, "nvim-tresitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed ='all',
  sync_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true
  },
  indent = { enable = true }
}
