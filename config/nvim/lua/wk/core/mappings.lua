local map = utils.map

local normal = {
  ['<S-h>'] = { '<cmd>vertical resize -5<cr>', 'make te window smaller vertical' },
  ['<S-l>'] = { '<cmd>vertical resize +5<cr>', 'make te window bigger vertical' },
  ['<S-j>'] = { '<cmd>resize -5<cr>', 'make te window smaller horizontal' },
  ['<S-k>'] = { '<cmd>resize +5<cr>', 'make te window bigger horizontal' }
}

map('n', normal)

-- Netrw mapping
function NetrwMapping()
  vim.api.nvim_buf_set_keymap(0, "n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { noremap = true, silent = true })
end

vim.cmd([[
  augroup netrw_mapping
    autocmd!
    autocmd FileType netrw lua NetrwMapping()
  augroup END
]])
