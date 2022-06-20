local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

local altJ = "∆" -- ∆ is os x output return ALT + j
local altK = "Λ" -- Λ is my output return ALT + k https://superuser.com/a/463517

-- space is my leader key
keymap("", "<Space>", "<Nop", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- file explorer
keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- resize windows with arrows
keymap("n", "<C-Up>", ":resize +2<cr>", opts)
keymap("n", "<C-Down>", ":resize -2<cr>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts)

-- navigate buffers
keymap("n", "<S-l>", ":bnext<cr>", opts)
keymap("n", "<S-h>", ":bprevious<cr>", opts)

-- Move text up and down
keymap("n", altJ, "<Esc>:m .+1<CR>==gi", opts)
keymap("n", altK, "<Esc>:m .-2<CR>==gi", opts)

-- Move text up and down
keymap("n", altJ, "<Esc>:m .+1<CR>==gi", opts)
keymap("n", altK, "<Esc>:m .-2<CR>==gi", opts)

-- VISUAL MODE
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", altJ, ":m .+1<CR>==", opts)
keymap("v", altK, ":m .-2<CR>==", opts)

-- pasting without yanking
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", altJ, ":move '>+1<CR>gv-gv", opts)
keymap("x", altK, ":move '<-2<CR>gv-gv", opts)

-- Telescope --
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)


-- Nvim tree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)
