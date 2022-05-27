local map = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true } 

vim.g.mapleader = ' '

-- Save and exit
map('n', 'q', ':w<CR>', opts)
map('n', 'Q', ':q<CR>', opts)

-- Nvim Tree
map('n', '<F2>', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>r', ':NvimTreeRefresh<CR>', opts)
map('n', '<leader>n', ':NvimTreeFindFile<CR>', opts)

-- Change split
map('n', '<C-J>', '<C-W><C-J>', opts)
map('n', '<C-K>', '<C-W><C-K>', opts)
map('n', '<C-L>', '<C-W><C-L>', opts)
map('n', '<C-H>', '<C-W><C-H>', opts)
