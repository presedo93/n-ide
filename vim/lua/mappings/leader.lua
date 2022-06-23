local wk = require('which-key')

-- Leader -> n
wk.register(
    {
        ['R'] = { ':NvimTreeRefresh<CR>', 'tree -> Refresh side tree' },
        ['n'] = { ':NvimTreeFindFile<CR>', 'tree -> Find file in side tree' },
        ['f'] = {
            name = 'Files',
            ['f'] = { ':Telescope find_files<CR>', 'TL -> Find files' },
            ['g'] = { ':Telescope live_grep<CR>', 'TL -> Live search' },
            ['b'] = { ':Telescope buffers<CR>', 'TL -> buffers' },
            ['s'] = { ':Telescope treesitter<CR>', 'TL -> treesitter' },
        },
        ['g'] = {
            name = 'Git',
            ['c'] = { ':Telescope git_commits<CR>', 'TL -> git commits' },
            ['s'] = { ':Telescope git_status<CR>', 'TL -> git status' },
            ['r'] = { ':Gitsigns reset_hunk<CR>', 'GS -> git reset'},
            ['t'] = { ':Gitsigns stage_hunk<CR>', 'GS -> git stage'},
            ['u'] = { ':Gitsigns undo_stage_hunk<CR>', 'GS -> git undo stage'},
        },
        ['e'] = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'LSP -> open float' },
        ['q'] = { '<cmd>lua vim.diagnostic.setloclist()<CR>', 'LSP -> set local list' },

        ['D'] = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'LSP -> Type definition' },
        ['rn'] = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'LSP -> Rename' },
        ['ca'] = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'LSP -> Code Action' },
        ['f'] = {
            ['c'] = {'<cmd>lua vim.lsp.buf.formatting()<CR>', 'LSP -> Formatting' },
        },
    },
    {
        mode = 'n',
        prefix = "<leader>",
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = false
    }
)

-- Leader -> v
wk.register(
    {
        ['g'] = {
            name = 'Git',
            ['r'] = { ':Gitsigns reset_hunk<CR>', 'GS -> git reset'},
            ['t'] = { ':Gitsigns stage_hunk<CR>', 'GS -> git stage'},
            ['u'] = { ':Gitsigns undo_stage_hunk<CR>', 'GS -> git undo stage'},
        },
    },
    {
        mode = 'v',
        prefix = '<leader>',
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = false
    }
)
