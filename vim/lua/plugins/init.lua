
return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use 'rstacruz/vim-closer'

    use 'EdenEast/nightfox.nvim'

    use 'feline-nvim/feline.nvim'

    use 'nanozuki/tabby.nvim'

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        tag = 'nightly'
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use 'lewis6991/gitsigns.nvim'

    use 'neovim/nvim-lspconfig'
  
end)
