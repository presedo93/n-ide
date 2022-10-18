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

        ['<C-N>'] = { ':nohlsearch<CR>', 'Disable highlightning search' },
        ['<C-C>'] = { ':qa<CR>', 'Close nvim and save session' },

        ['<S-Up>'] = { ':resize +2<CR>', 'Resize split up' },
        ['<S-Down>'] = { ':resize -2<CR>', 'Resize split down' },
        ['<S-Right>'] = { ':vertical resize +2<CR>', 'Resize split right' },
        ['<S-Left>'] = { ':vertical resize -2<CR>', 'Resize split left' },

        ['<A-Up>'] = { '<C-W>K', 'Move split up' },
        ['<A-Down>'] = { '<C-W>J', 'Move split down' },
        ['<A-Right>'] = { '<C-W>L', 'Move split right' },
        ['<A-Left>'] = { '<C-W>H', 'Move split left' },

        ['<A-j>'] = { ':m .+1<CR>==', 'Move line one up' },
        ['<A-k>'] = { ':m .-2<CR>==', 'Move line one down' },

        ['<A-.>'] = { ':tabn<CR>', 'tabby -> Next tabby tab' },
        ['<A-,>'] = { ':tabp<CR>', 'tabby -> Prev tabby tab' },

        ['x'] = { '"_x', 'Delete character' },
        ['d'] = { '"_d', 'Delete lines' },
        ['s'] = { '"_s', 'Replace character'},
        ['C'] = {
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
            ['s'] = {
                name = 'Surround -> change',
                ['a'] = { '>' },
                ['b'] = { ')' },
                ['B'] = { '}' },
                ['r'] = { ']' },
                ['q'] = { '"' },
            },
        },
        ['D'] = { '"_D', 'Delete until end of line' },

        ['y'] = {
            name = 'Copy to clipboard',
            ['d'] = { '"+d', 'Copy and Delete' },
            ['D'] = { '"+D', 'Copy and Delete til end of line' },
            ['y'] = { '"+y', 'Copy to clipboard' },
            ['s'] = { '"+s', 'Replace to clipboard' },
            ['S'] = {
                name = 'Surround -> insert mode',
                ['a'] = { '>' },
                ['b'] = { ')' },
                ['B'] = { '}' },
                ['r'] = { ']' },
                ['q'] = { '"' },
            },
            ['h'] = { ':YankyRingHistory<CR>', 'Yanky -> show yank history' },
        },

        ['z'] = {
            name = 'Folding',
            ['o'] = { 'UFO -> Open a folding' },
            ['c'] = { 'UFO -> Close a folding' },
            ['R'] = { '<cmd>lua require("ufo").openAllFolds()<CR>', 'UFO -> Open all foldings' },
            ['M'] = { '<cmd>lua require("ufo").closeAllFolds()<CR>', 'UFO -> Close all foldings' },
        },

        ['<F1>'] = { ':WhichKey<CR>', 'Which keys -> Show' },
        ['<F2>'] = { ':NvimTreeToggle<CR>', 'Side tree -> Toggle' },
        ['<F3>'] = { 'Terminal -> Toggle' },
        ['<F4>'] = { ':SymbolsOutline<CR>', 'symbols outline' },
        ['<F5>'] = { ':Telescope diagnostics theme=dropdown<CR>', 'TL -> diagnostics' },

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
            ['c'] = {
                ['c'] = { 'Comment -> comment line wise' },
                ['o'] = { 'Comment -> insert comment to the next line' },
                ['O'] = { 'Comment -> insert comment to the prev line' },
                ['A'] = { 'Comment -> insert comment to the end of the line' },
            },
            ['b'] = {
                ['c'] = { 'Comment -> comment block wise' },
            },
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
        ['x'] = { '"_x', 'Delete character' },
        ['s'] = { '"_s', 'Replace lines' },
        ['y'] = {
            name = 'Copy to clipboard',
            ['d'] = { '"+d', 'Delete and copy' },
            ['x'] = { '"+x', 'Delete and copy' },
            ['s'] = { '"+s', 'Replace and Delete' },
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

        ['g'] = {
            name = "Comment code",
            ['c'] = { 'Comment -> line wise' },
            ['b'] = { 'Comment -> block wise' },
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
