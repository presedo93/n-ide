require('ui.tabby')
require('ui.feline')

require('nightfox').setup({
    options = {
        transparent = true,
        styles = {
            comments = 'italic',
            conditionals = 'italic',
            constants = 'bold,italic',
            functions = 'italic'
        }
    }
})

require'shade'.setup({
  overlay_opacity = 30,
  opacity_step = 1,
  keys = {
    -- brightness_up    = '<C-Up>',
    -- brightness_down  = '<C-Down>',
    toggle           = '<Leader>s',
  }
})

-- Colors and auto close pairs
require('nvim-autopairs').setup({})

-- Whitespaces
require('whitespace-nvim').setup({
    -- configuration options and their defaults

    -- `highlight` configures which highlight is used to display
    -- trailing whitespace
    highlight = 'DiffDelete',

    -- `ignored_filetypes` configures which filetypes to ignore when
    -- displaying trailing whitespace
    ignored_filetypes = { 'TelescopePrompt' },
})
