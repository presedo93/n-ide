require('plugins')
require('settings')
require('mappings')

-- Plugins
require('colors')
vim.cmd('colorscheme nightfox')
require('plugins.tree')
require('plugins.sitter')
require('plugins.signs')

-- LSP
require('lsp')
