pcall(require, 'impatient')
require('plugins.impatient')

require('plugins')
require('settings')
require('mappings')

-- Plugins
require('plugins.alpha')
require('plugins.nvimtree')
require('plugins.treesitter')
require('plugins.gitsigns')
require('plugins.term')
require('plugins.null')
require('plugins.persistence')

-- Ui
require('ui')
vim.cmd('colorscheme nightfox')

vim.api.nvim_set_hl(0, "VertSplit", { fg = "#63cdcf"} )

-- LSP
require('lsp')

-- DAP
require('dbg')
