local wk = require('which-key')

wk.register(
    {
        q = {':w<CR>', 'Save the file' },
    },
    {
        mode = 'n',
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = false
    }
)
