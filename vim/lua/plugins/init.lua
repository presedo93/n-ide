require('plugins.tree')
require('plugins.sitter')

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use 'rstacruz/vim-closer'

    use 'EdenEast/nightfox.nvim'

    use 'feline-nvim/feline.nvim'

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
end)
