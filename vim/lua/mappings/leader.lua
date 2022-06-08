local wk = require('which-key')

-- Leader -> n
wk.register(
    {
        ['<leader>'] = {
            name = 'Leader',
            ['d'] = { '"+d', 'Copy and Delete' },
            ['D'] = { '"+D', 'Copy and Delete til end of line' },
            ['y'] = { '"+y', 'Copy to clipboard' },
            ['r'] = { ':NvimTreeRefresh<CR>', 'tree -> Refresh side tree' },
            ['n'] = { ':NvimTreeFindFile<CR>', 'tree -> Find file in side tree' },
            ['t'] = { ':$tabnew<CR>', 'Ctree -> reate new tab' },
            ['f'] = {
                ['c'] = { ':Format<CR>', 'Format the code' },
                ['f'] = { ':Telescope find_files<CR>', 'TL -> Find files' },
                ['g'] = { ':Telescope live_grep<CR>', 'TL -> Live search' },
                ['b'] = { ':Telescope buffers<CR>', 'TL -> buffers' },
            },
            ['F'] = { ['c'] = { ':FormatWrite<CR>', 'Format and save' } },
            ['g'] = {
                ['c'] = { ':Telescope git_commits<CR>', 'TL -> git commits' },
                ['s'] = { ':Telescope git_status<CR>', 'TL -> git status' },
            },
            ['t'] = { ['s'] = { ':Telescope treesitter<CR>', 'TL -> treesitter' } },
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

-- Leader -> v
wk.register(
    {
        ['<leader>'] = {
            name = 'Leader',
            ['d'] = { '"+d', 'Copy and Delete' },
            ['D'] = { '"+D', 'Copy and Delete til end of line' },
            ['y'] = { '"+y', 'Copy to clipboard' },
        }
    },
    {
        mode = 'v',
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = false
    }
)
