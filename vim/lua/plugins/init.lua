local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'

    use 'windwp/nvim-autopairs'
    
    use 'p00f/nvim-ts-rainbow'

    use 'windwp/nvim-ts-autotag'

    use 'EdenEast/nightfox.nvim'

    use 'feline-nvim/feline.nvim'

    use 'johnfrankmorgan/whitespace.nvim'

    use 'nanozuki/tabby.nvim'

    use 'mhartington/formatter.nvim'

    use 'folke/which-key.nvim'

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

    use 'sunjon/shade.nvim'

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

    use 'mfussenegger/nvim-dap'

    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

    use { "Pocco81/DAPInstall.nvim", commit = "24923c3819a450a772bb8f675926d530e829665f" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
