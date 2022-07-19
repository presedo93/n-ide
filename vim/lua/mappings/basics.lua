local wk = require('which-key')

-- Basics -> n
wk.register(
    {
        ['q'] = {':w<CR>', 'Save the file' },
        ['<esc>'] = {
            ['<esc>'] = { ':q<CR>', 'Close the view' },
        },
        ['U'] = { '<C-r>', 'Re-do what was un-done' },

        ['<C-T>'] = { ':$tabnew<CR>', 'tree -> create new tab' },

        ['<C-J>'] = { '<C-W><C-J>', 'Move down in splits' },
        ['<C-K>'] = { '<C-W><C-K>', 'Move up in splits' },
        ['<C-L>'] = { '<C-W><C-L>', 'Move right in splits' },
        ['<C-H>'] = { '<C-W><C-H>', 'Move left in splits' },

        ['<C-r>'] = { ':nohlsearch', 'Disable highlightning search' },

        ['<S-Up>'] = { '<C-W>+', 'Resize split up' },
        ['<S-Down>'] = { '<C-W>-', 'Resize split down' },
        ['<S-Right>'] = { '<C-W>>', 'Resize split right' },
        ['<S-Left>'] = { '<C-W><', 'Resize split left' },

        ['<M-Up>'] = { '<C-W>K', 'Move split up' },
        ['<M-Down>'] = { '<C-W>J', 'Move split down' },
        ['<M-Right>'] = { '<C-W>L', 'Move split right' },
        ['<M-Left>'] = { '<C-W>H', 'Move split left' },

        ['<M-j>'] = { ':m .+1<CR>==', 'Move line one up' },
        ['<M-k>'] = { ':m .-2<CR>==', 'Move line one down' },

        ['<M-.>'] = { ':tabn<CR>', 'tabby -> Next tabby tab' },
        ['<M-,>'] = { ':tabp<CR>', 'tabby -> Prev tabby tab' },

        ['x'] = { '"_x', 'Delete character' },
        ['d'] = { '"_d', 'Delete lines' },
        ['d'] = {
            ['s'] = {
                name = 'Surround -> delete',
                ['a'] = { '>' },
                ['b'] = { ')' },
                ['B'] = { '}' },
                ['r'] = { ']' },
                ['q'] = { '"' },
            },
        },
        ['c'] = {
            name = 'Sorrund -> change'},
            ['s'] = {
                name = 'Surround -> change',
                ['a'] = { '>' },
                ['b'] = { ')' },
                ['B'] = { '}' },
                ['r'] = { ']' },
                ['q'] = { '"' },
            },
        ['D'] = { '"_D', 'Delete until end of line' },

        ['y'] = {
            name = 'Copy to clipboard',
            ['d'] = { '"+d', 'Copy and Delete' },
            ['D'] = { '"+D', 'Copy and Delete til end of line' },
            ['y'] = { '"+y', 'Copy to clipboard' },
            ['s'] = {
                name = 'Surround -> insert mode',
                ['a'] = { '>' },
                ['b'] = { ')' },
                ['B'] = { '}' },
                ['r'] = { ']' },
                ['q'] = { '"' },
            },
        },

        ['z'] = {
            name = 'Folding',
            ['o'] = { 'UFO -> Open a folding' },
            ['c'] = { 'UFO -> Close a folding' },
            ['R'] = { '<cmd>lua require("ufo").openAllFolds()<CR>', 'UFO -> Open all foldings' },
            ['M'] = { '<cmd>lua require("ufo").closeAllFolds()<CR>', 'UFO -> Close all foldings' },
        },

        ['<F1>'] = { ':WhichKey<CR>', 'Show which keys' },
        ['<F2>'] = { ':NvimTreeToggle<CR>', 'Toggle side tree' },
        ['<F3>'] = { 'Toggle Terminal' },
        ['<F4>'] = { ':AerialToggle left<CR>', 'Aerial -> Toggle' },

        ['['] = {
            ['d'] = { '<cmd>lua vim.diagnostic.goto_prev()<CR>', 'LSP -> go to next' }
        },

        [']'] = {
            ['d'] = { '<cmd>lua vim.diagnostic.goto_next()<CR>', 'LSP -> go to prev' }
        },

        ['g'] = {
            name = 'LSP shortcuts',
            ['d'] = { 'LSP -> Go to definition' },
            ['i'] = { 'LSP -> Go to implementation' },
            ['r'] = { 'LSP -> Go to references' },
        },

        ['K'] = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'LSP -> Hover' },
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
        ['y'] = {
            name = 'Copy to clipboard',
            ['d'] = { '"+d', 'Copy and Delete' },
            ['y'] = { '"+y', 'Copy to clipboard' },
        },

        ['S'] = {
            name = 'Surround -> select',
            ['a'] = { '>' },
            ['b'] = { ')' },
            ['B'] = { '}' },
            ['r'] = { ']' },
            ['q'] = { '"' },
        },

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
