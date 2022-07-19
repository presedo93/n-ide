local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)

    -- Packer

    use 'wbthomason/packer.nvim'

    -- 1st

    use { 'lewis6991/impatient.nvim' }

    use { 'goolord/alpha-nvim' }

    -- Themes / UI

    use 'EdenEast/nightfox.nvim'

    use 'feline-nvim/feline.nvim'

    use 'nanozuki/tabby.nvim'

    use 'folke/which-key.nvim'

    use 'bronson/vim-trailing-whitespace'

    use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' }, tag = 'nightly' }

    use 'akinsho/toggleterm.nvim'

    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

    use { 'stevearc/aerial.nvim' }

    use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }

    use { 'folke/trouble.nvim', requires = "kyazdani42/nvim-web-devicons" }

    -- Tags & pairs

    use 'windwp/nvim-ts-autotag'

    use 'windwp/nvim-autopairs'

    use 'p00f/nvim-ts-rainbow'

    use 'kylechui/nvim-surround'

    -- Tree-sitter

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use 'nvim-treesitter/nvim-treesitter-refactor'

    use { 'SmiteshP/nvim-gps', requires = 'nvim-treesitter/nvim-treesitter' }

    use { 'm-demare/hlargs.nvim', requires = { 'nvim-treesitter/nvim-treesitter' } }

    -- LSP & snippets

    use 'neovim/nvim-lspconfig'

    use 'nvim-lua/lsp-status.nvim'

    use 'williamboman/nvim-lsp-installer'

    use 'hrsh7th/nvim-cmp'

    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp

    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp

    use 'L3MON4D3/LuaSnip' -- Snippets plugin

    use 'rafamadriz/friendly-snippets'

    -- DAP

    use 'mfussenegger/nvim-dap'

    use 'mfussenegger/nvim-dap-python'

    use 'theHamsta/nvim-dap-virtual-text'

    use 'rcarriga/nvim-dap-ui'

    use { 'Pocco81/DAPInstall.nvim', branch = 'dev' }

    -- Telescope

    use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }

    use 'nvim-telescope/telescope-dap.nvim'

    -- Git & comments

    use 'lewis6991/gitsigns.nvim'

    use 'numToStr/Comment.nvim'

    -- Languages & tools

    use 'simrat39/rust-tools.nvim'

    --
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
