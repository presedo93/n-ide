
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
  
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp

    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
end)
