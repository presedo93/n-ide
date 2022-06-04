
return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use 'rstacruz/vim-closer'

    use 'EdenEast/nightfox.nvim'

    use 'feline-nvim/feline.nvim'

    use 'nanozuki/tabby.nvim'

    use 'mhartington/formatter.nvim'

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

    use 'nvim-treesitter/nvim-treesitter-refactor'

    use {
	    "SmiteshP/nvim-gps",
	    requires = "nvim-treesitter/nvim-treesitter"
    }

    use 'b3nj5m1n/kommentary'

    use 'lewis6991/gitsigns.nvim'

    use 'neovim/nvim-lspconfig'

    use 'williamboman/nvim-lsp-installer'
  
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp

    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'nvim-lua/lsp-status.nvim'
end)
