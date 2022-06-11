require('plugins')
require('settings')
require('mappings')

-- Plugins
require('ui')
vim.cmd('colorscheme nightfox')
require('plugins.nvimtree')
require('plugins.treesitter')
require('plugins.gitsigns')

-- LSP
require('lsp')

-- DAP
require('dbg')
