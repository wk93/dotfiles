local map = utils.map

local normal = {
  ['<S-h>'] = { '<cmd>vertical resize -5<cr>', 'make te window smaller vertical' },
  ['<S-l>'] = { '<cmd>vertical resize +5<cr>', 'make te window bigger vertical' },
  ['<S-j>'] = { '<cmd>resize -5<cr>', 'make te window smaller horizontal' },
  ['<S-k>'] = { '<cmd>resize +5<cr>', 'make te window bigger horizontal' }
}

map('n', normal)
