local wk = require('which-key')

-- Basics -> n
wk.register(
    {
        ['<leader>'] = {
            name = 'Leader',
            ['d'] = { '"+d', 'Copy and Delete' },
            ['D'] = { '"+D', 'Copy and Delete til end of line' },
            ['y'] = { '"+y', 'Copy to clipboard' },
            ['r'] = { ':NvimTreeRefresh<CR>', 'Refresh side tree' },
            ['n'] = { ':NvimTreeFindFile<CR>', 'Find file in side tree' },
            ['t'] = { ':$tabnew<CR>', 'Create new tab' },
            ['fc'] = { ':Format<CR>', 'Format the code' },
            ['Fc'] = { ':FormatWrite<CR>', 'Format and save' },
            ['ff'] = { ':Telescope find_files<CR>', 'TL -> Find files' },
            ['fg'] = { ':Telescope live_grep<CR>', 'TL -> Live search' },
            ['fb'] = { ':Telescope buffers<CR>', 'TL -> buffers' },
            ['gc'] = { ':Telescope git_commits<CR>', 'TL -> git commits' },
            ['gs'] = { ':Telescope git_status<CR>', 'TL -> git status' },
            ['ts'] = { ':Telescope treesitter<CR>', 'TL -> treesitter' },
            ['e'] = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'LSP -> open float' },
            ['q'] = { '<cmd>lua vim.diagnostic.setloclist()<CR>', 'LSP -> set local list' },
        }
    },
    {
        mode = 'n',
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = false
    }
)
