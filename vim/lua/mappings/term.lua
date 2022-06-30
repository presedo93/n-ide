local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", direction = 'float', hidden = true })
local wk = require('which-key')

function _lazygit_toggle()
  lazygit:toggle()
end

-- ToggleTerm -> n
wk.register(
    {
        ['t'] = {
            name = 'Terminal',
            ['g'] = { '<cmd>lua _lazygit_toggle()<CR>', 'Launch lazygit' }
        }
    },
    {
        mode = 'n',
        prefix = '<leader>',
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = false
    }
)
