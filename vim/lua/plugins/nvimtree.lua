require('nvim-tree').setup {
    open_on_tab = true,
    view = {
        side = 'right',
        mappings = {
            list = {
                { key = "v",                        action = "vsplit" },
                { key = "x",                        action = "split"  },
                { key = "t",                        action = "tabnew" },
            },
        },
    },
    renderer = {
        icons = {
            git_placement = 'after'
        }
    }
}

vim.api.nvim_create_autocmd('BufEnter', {
    command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
    nested = true,
})
