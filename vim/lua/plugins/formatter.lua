require('formatter').setup {
    filetype = {
        lua = {
            require('formatter.filetypes.lua').stylua
        },
        python = {
            require('formatter.filetypes.python').black
        },
        rust = {
            require('formatter.filetypes.rust').rustfmt
        },
        typescript = {
            require('formatter.filetypes.typescript').prettier
        },
        typescriptreact = {
            require('formatter.filetypes.typescriptreact').prettier
        },
        javascript = {
            require('formatter.filetypes.javascript').prettier
        },
        javascriptreact = {
            require('formatter.filetypes.javascriptreact').prettier
        },
    }
}
