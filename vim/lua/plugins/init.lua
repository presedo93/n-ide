local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Packer

     'wbthomason/packer.nvim',

    -- 1st

     'lewis6991/impatient.nvim',

     'goolord/alpha-nvim',

    -- Themes / UI

     'EdenEast/nightfox.nvim',

     'feline-nvim/feline.nvim',

     'nanozuki/tabby.nvim',

     'folke/which-key.nvim',

     { 'kyazdani42/nvim-tree.lua', dependencies = { 'kyazdani42/nvim-web-devicons' }, tag = 'nightly' },

     'akinsho/toggleterm.nvim',

     { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' },

     { 'folke/todo-comments.nvim', dependencies = 'nvim-lua/plenary.nvim' },

     { 'norcalli/nvim-colorizer.lua' },

     { 'simrat39/symbols-outline.nvim' },

     { 'gbprod/yanky.nvim' },

     { 'vigoux/notifier.nvim' },

     { 'stevearc/dressing.nvim' },

    -- Session management

     { 'folke/persistence.nvim', event = 'BufReadPre' },

     { 'sindrets/winshift.nvim' },

    -- Pairs

     'windwp/nvim-autopairs',

     'kylechui/nvim-surround',

    -- Tree-sitter

     { 'nvim-treesitter/nvim-treesitter', lazy = true, build = ':TSUpdate' },

     'nvim-treesitter/nvim-treesitter-refactor',

     { 'SmiteshP/nvim-gps', dependencies = 'nvim-treesitter/nvim-treesitter' },

     { 'm-demare/hlargs.nvim', dependencies = 'nvim-treesitter/nvim-treesitter' },

     'windwp/nvim-ts-autotag',

     'p00f/nvim-ts-rainbow',

     'JoosepAlviste/nvim-ts-context-commentstring',

    -- Autocompletion

     'folke/neodev.nvim',

     'hrsh7th/nvim-cmp',

     'hrsh7th/cmp-buffer',

     'hrsh7th/cmp-path',

     'hrsh7th/cmp-cmdline',

     'saadparwaiz1/cmp_luasnip',

     'hrsh7th/cmp-nvim-lsp',

     'hrsh7th/cmp-nvim-lua',

    -- Snippets

     'L3MON4D3/LuaSnip',

     'rafamadriz/friendly-snippets',

    -- LSP

     'neovim/nvim-lspconfig',

     'williamboman/mason-lspconfig.nvim',

     'williamboman/mason.nvim',

     'jay-babu/mason-nvim-dap.nvim',

     'ray-x/lsp_signature.nvim',

    -- Linting

     'jose-elias-alvarez/null-ls.nvim',

    -- DAP

     'mfussenegger/nvim-dap',

     'mfussenegger/nvim-dap-python',

     'theHamsta/nvim-dap-virtual-text',

     'rcarriga/nvim-dap-ui',

    -- Telescope

     { 'nvim-telescope/telescope.nvim', dependencies = { { 'nvim-lua/plenary.nvim' } } },

     'nvim-telescope/telescope-dap.nvim',

    -- Git & comments

     'lewis6991/gitsigns.nvim',

     'b3nj5m1n/kommentary',

    -- Languages & tools

     'simrat39/rust-tools.nvim',

    -- Copilot

     {
      "zbirenbaum/copilot.lua",
      dependencies = "feline.nvim",
      config = function ()
        vim.defer_fn(function()
          require("copilot").setup()
        end, 100)
      end,
    },

     {
      "zbirenbaum/copilot-cmp",
      dependencies = { "copilot.lua" },
      config = function ()
        require("copilot_cmp").setup()
      end
    },

    -- Dadbod UI

    --  'tpope/vim-dadbod'
    --  'kristijanhusak/vim-dadbod-ui'
})

-- Load the rest of the plugins
require('plugins.alpha')
require('plugins.nvimtree')
require('plugins.treesitter')
require('plugins.gitsigns')
require('plugins.term')
require('plugins.null')
require('plugins.persistence')

