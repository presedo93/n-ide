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

-- Colors and auto close pairs
require('nvim-autopairs').setup({})
