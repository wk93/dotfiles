local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup({
  insert_mappings = true
})

function _G.set_terminal_keymaps()
  local keymap = function(key, map)
    vim.api.nvim_buf_set_keymap(0, 't', key, map, { noremap = true })
  end

  keymap('<esc>', [[<C-\><C-n>]])
  keymap('<C-h>', [[<C-\><C-n><C-W>h]])
  keymap('<C-j>', [[<C-\><C-n><C-W>j]])
  keymap('<C-k>', [[<C-\><C-n><C-W>k]])
  keymap('<C-l>', [[<C-\><C-n><C-W>l]])
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ direction = 'float', cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end
