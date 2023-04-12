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
require('nvim-autopairs').setup({
    check_ts = true,
    ts_config = {
        lua = { 'string' },
        javascript = { 'template_string' },
        java = false,
    },
    disable_filetype = { 'TelescopePrompt' }
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

-- Highlight arguments
require('hlargs').setup()

-- Surround
require('nvim-surround').setup({
    keymaps = {
        delete = "Cs"
    }
})

-- UFO
require('ufo').setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end
})

-- TO-DO
require('todo-comments').setup()

-- Colorizer
require('colorizer').setup()

-- Outline
require('symbols-outline').setup()

-- Yanky
require('yanky').setup()

-- Notify
vim.api.nvim_set_hl(0, 'NotifyBackground', {bg='#000000'})
require('notifier').setup()

-- Dressing
require('dressing').setup()
