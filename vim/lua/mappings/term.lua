local Terminal  = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({ cmd = "lazygit", direction = 'float', hidden = true })
local htop = Terminal:new({ cmd = "htop", direction = 'float', hidden = true })
local docker = Terminal:new({ cmd = "watch -n 1 docker ps", direction = 'float', hidden = true })

local wk = require('which-key')

function _lazygit_toggle()
  lazygit:toggle()
end

function _htop_toggle()
  htop:toggle()
end

function _docker_toggle()
    docker:toggle()
end

-- ToggleTerm -> n
wk.register(
    {
        ['t'] = {
            name = 'Terminal',
            ['g'] = { '<cmd>lua _lazygit_toggle()<CR>', 'Launch lazygit' },
            ['h'] = { '<cmd>lua _htop_toggle()<CR>', 'Launch htop'},
            ['d'] = { '<cmd>lua _docker_toggle()<CR>', 'Launch docker ps' },
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
