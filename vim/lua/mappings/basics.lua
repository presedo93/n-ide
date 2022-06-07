local wk = require('which-key')

-- Basics -> n
wk.register(
    {
        ['q'] = {':w<CR>', 'Save the file' },
        ['<esc><esc>'] = { ':q<CR>', 'Close the view' },
        ['U'] = { '<C-r>', 'Re-do what was un-done' },

        ['<C-J>'] = { '<C-W><C-J>', 'Move down in splits' },
        ['<C-K>'] = { '<C-W><C-K>', 'Move up in splits' },
        ['<C-L>'] = { '<C-W><C-L>', 'Move right in splits' },
        ['<C-H>'] = { '<C-W><C-H>', 'Move left in splits' },

        ['<S-Up>'] = { '<C-W>K', 'Move split up' },
        ['<S-Down>'] = { '<C-W>J', 'Move split down' },
        ['<S-Right>'] = { '<C-W>L', 'Move split right' },
        ['<S-Left>'] = { '<C-W>H', 'Move split left' },

        ['<M-Up>'] = { '<C-W>-', 'Resize split up' },
        ['<M-Down>'] = { '<C-W>+', 'Resize split down' },
        ['<M-Right>'] = { '<C-W>>', 'Resize split right' },
        ['<M-Left>'] = { '<C-W><', 'Resize split left' },

        ['<M-j>'] = { ':m .+1<CR>==', 'Move line one up' },
        ['<M-k>'] = { ':m .-2<CR>==', 'Move line one down' },

        ['x'] = { '"_x', 'Delete character' },
        ['d'] = { '"_d', 'Delete lines' },
        ['D'] = { '"_D', 'Delete until end of line' },
        ['<F2>'] = { ':NvimTreeToggle<CR>', 'Toggle side tree' },
        ['[d'] = { '<cmd>lua vim.diagnostic.goto_prev()<CR>', 'LSP -> go to next' },
        [']d'] = { '<cmd>lua vim.diagnostic.goto_next()<CR>', 'LSP -> go to prev' },
        ['<'] = { '<gv', 'Left indent' },
        ['>'] = { '>gv', 'Left indent' },
    },
    {
        mode = 'n',
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = false
    }
)

-- Basics -> i
wk.register(
    {
        ['<M-j>'] = { '<Esc>:m .+1<CR>==gi', 'Move line one up' },
        ['<M-k>'] = { '<Esc>:m .-2<CR>==gi', 'Move line one up' },
    },
    {
        mode = 'i',
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = false
    }
)

-- Basics -> v
wk.register(
    {
        ['<M-j>'] = { ":m '>+1<CR>gv=gv", 'Move line one up' },
        ['<M-k>'] = { ":m '<-2<CR>gv=gv", 'Move line one up' },

        ['d'] = { '"_d', 'Delete lines' },

        ['<'] = { '<gv', 'Left indent' },
        ['>'] = { '>gv', 'Left indent' },
    },
    {
        mode = 'v',
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = false
    }
)
