local Terminal  = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({ cmd = "lazygit", direction = 'float', hidden = true })
local htop = Terminal:new({ cmd = "htop", direction = 'float', hidden = true })

local wk = require('which-key')

function _lazygit_toggle()
  lazygit:toggle()
end

function _htop_toggle()
  htop:toggle()
end

-- ToggleTerm -> n
wk.register(
    {
        ['t'] = {
            name = 'Terminal',
            ['g'] = { '<cmd>lua _lazygit_toggle()<CR>', 'Launch lazygit' },
            ['h'] = { '<cmd>lua _htop_toggle()<CR>', 'Launch htop'},
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
