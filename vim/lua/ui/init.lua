require('ui.tabby')
require('ui.feline')

-- Nightfox themes
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

-- Sidebar
require("sidebar-nvim").setup({
    sections = { "symbols", "diagnostics", "containers" },
})
