pcall(require, 'impatient')
require('plugins.impatient')

-- Order must not be changed
require('settings')
require('plugins')
require('mappings')
require('lsp')
require('dbg')

-- UI
require('ui')
vim.cmd.colorscheme "duskfox"
