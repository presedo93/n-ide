local wk = require('which-key')

-- Leader -> n
wk.register(
    {
        ['R'] = { ':NvimTreeRefresh<CR>', 'tree -> Refresh side tree' },
        ['n'] = { ':NvimTreeFindFile<CR>', 'tree -> Find file in side tree' },
        ['f'] = {
            name = 'Telescope',
            ['f'] = { ':Telescope find_files previewer=false theme=dropdown<CR>', 'TL -> Find files' },
            ['c'] = { '<cmd>lua vim.lsp.buf.format{ async = true }<CR>', 'LSP -> Formatting' },
            ['g'] = { ':Telescope live_grep<CR>', 'TL -> Live search' },
            ['b'] = { ':Telescope buffers<CR>', 'TL -> buffers' },
            ['s'] = { ':Telescope treesitter previewer=false theme=dropdown<CR>', 'TL -> treesitter' },
            ['d'] = { ':Telescope diagnostics theme=dropdown<CR>', 'TL -> diagnostics' },
            ['r'] = { ':Telescope lsp_references<CR>', 'TL -> references' },
            ['t'] = { ':TodoTelescope theme=dropdown<CR>', 'TL -> todos' },
        },
        ['g'] = {
            name = 'Git',
            ['p'] = { ':Gitsigns prev_hunk<CR>', 'GS -> git prev hunk' },
            ['n'] = { ':Gitsigns next_hunk<CR>', 'GS -> git next hunk' },
            ['P'] = { ':Gitsigns preview_hunk<CR>', 'GS -> git preview hunk' },
            ['r'] = { ':Gitsigns reset_hunk<CR>', 'GS -> git reset'},
            ['t'] = { ':Gitsigns stage_hunk<CR>', 'GS -> git stage'},
            ['u'] = { ':Gitsigns undo_stage_hunk<CR>', 'GS -> git undo stage'},
        },
        ['e'] = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'LSP -> open float' },
        ['q'] = { '<cmd>lua vim.diagnostic.setloclist()<CR>', 'LSP -> set local list' },
        ['D'] = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'LSP -> Type definition' },
        ['r'] = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'LSP -> Rename' },
        ['c'] = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'LSP -> Code Action' },
        ['t'] = {
            ['n'] = { ':+tabmove<CR>', 'tabby -> move to next position' },
            ['p'] = { ':-tabmove<CR>', 'tabby -> move to prev position' },
        },
        ['l'] = {
            name = 'Session Management',
            ['l'] = { '<cmd>lua require("persistence").load()<cr>', 'Persistance -> restore the directory session' },
            ['q'] = { '<cmd>lua require("persistence").load({ last = true })<cr>', 'Persistance -> restore last session' },
        },
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
