pcall(require, 'impatient')

require('plugins')
require('settings')
require('mappings')

-- Plugins
require('ui')
require('plugins.nvimtree')
require('plugins.treesitter')
require('plugins.gitsigns')
require('plugins.term')
vim.cmd('colorscheme nightfox')

-- LSP
require('lsp')

-- DAP
require('dbg')
