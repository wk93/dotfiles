local keymap = require("wk.core.keymap")
local nmap = keymap.nmap
local imap = keymap.imap
local vmap = keymap.vmap
local tmap = keymap.tmap

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
