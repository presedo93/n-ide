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
  overlay_opacity = 50,
  opacity_step = 1,
  keys = {
    -- brightness_up    = '<C-Up>',
    -- brightness_down  = '<C-Down>',
    toggle           = '<Leader>s',
  }
})
