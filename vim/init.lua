require('plugins')
require('settings')
require('mappings')

-- Plugins
require('ui')
vim.cmd('colorscheme nightfox')
require('plugins.nvimtree')
require('plugins.treesitter')
require('plugins.gitsigns')
require('plugins.formatter')

-- LSP
require('lsp')
