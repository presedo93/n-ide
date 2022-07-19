pcall(require, 'impatient')

require('plugins')
require('settings')
require('mappings')

-- Plugins
require('plugins.alpha')
require('plugins.nvimtree')
require('plugins.treesitter')
require('plugins.gitsigns')
require('plugins.term')
require('plugins.splits')

-- Ui
require('ui')
vim.cmd('colorscheme nightfox')

-- LSP
require('lsp')

-- DAP
require('dbg')
