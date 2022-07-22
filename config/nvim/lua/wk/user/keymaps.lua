local keymap = require("wk.core.keymap")
local telescope = require("wk.user.telescope")
local nmap = keymap.nmap
local imap = keymap.imap
local vmap = keymap.vmap

-- Disable arrows
imap('<Up>', '')
imap('<Down>', '')
imap('<Left>', '')
imap('<Right>', '')
vmap('<Up>', '')
vmap('<Down>', '')
vmap('<Left>', '')
vmap('<Right>', '')
nmap('<Up>', '')
nmap('<Down>', '')
nmap('<Left>', '')
nmap('<Right>', '')

-- Update config
nmap('<Leader>rc', [[<Cmd>ReloadConfig<CR>]])


nmap('<Leader>ff', telescope.find_files)
nmap('<Leader>fg', telescope.live_grep)
nmap('<Leader>fb', telescope.buffers)
