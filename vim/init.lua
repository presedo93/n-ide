pcall(require, 'impatient')
require('plugins.impatient')

-- Order must not be changed
require('settings')
require('plugins')
require('mappings')

-- UI
require('ui')
vim.cmd('colorscheme duskfox')

vim.api.nvim_set_hl(0, "VertSplit", { fg = "#63cdcf"} )

-- LSP
require('lsp')

-- DAP
require('dbg')
