require('plugins')
require('settings')
require('mappings')

-- Plugins
require('ui')
require('plugins.nvimtree')
require('plugins.treesitter')
require('plugins.gitsigns')
vim.cmd('colorscheme nightfox')

-- LSP
require('lsp')

-- DAP
require('dbg')
