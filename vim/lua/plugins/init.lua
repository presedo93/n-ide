local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end

-- Autocmd that reloads neovim whenever you save the init.lua file
-- vim.cmd [[
--     augroup packer_user_config
--         autocmd!
--         autocmd BufWritePost init.lua source <afile> | PackerSync
--     augroup end
-- ]]

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return packer.startup(function(use)

    -- Packer

    use 'wbthomason/packer.nvim'

    -- 1st

    use 'lewis6991/impatient.nvim'

    use 'goolord/alpha-nvim'

    -- Themes / UI

    use 'EdenEast/nightfox.nvim'

    use 'feline-nvim/feline.nvim'

    use 'nanozuki/tabby.nvim'

    use 'folke/which-key.nvim'

    use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' }, tag = 'nightly' }

    use 'akinsho/toggleterm.nvim'

    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

    use { 'folke/todo-comments.nvim', requires = 'nvim-lua/plenary.nvim' }

    use { 'norcalli/nvim-colorizer.lua' }

    use { 'simrat39/symbols-outline.nvim' }

    use { 'gbprod/yanky.nvim' }

    use { 'vigoux/notifier.nvim' }

    use { 'stevearc/dressing.nvim' }

    -- Session management

    use { 'folke/persistence.nvim', event = 'BufReadPre', module = 'persistence' }

    use { 'sindrets/winshift.nvim' }

    -- Pairs

    use 'windwp/nvim-autopairs'

    use 'kylechui/nvim-surround'

    -- Tree-sitter

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use 'nvim-treesitter/nvim-treesitter-refactor'

    use { 'SmiteshP/nvim-gps', requires = 'nvim-treesitter/nvim-treesitter' }

    use { 'm-demare/hlargs.nvim', requires = 'nvim-treesitter/nvim-treesitter' }

    use 'windwp/nvim-ts-autotag'

    use 'p00f/nvim-ts-rainbow'

    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- Autocompletion

    use 'hrsh7th/nvim-cmp'

    use 'hrsh7th/cmp-buffer'

    use 'hrsh7th/cmp-path'

    use 'hrsh7th/cmp-cmdline'

    use 'saadparwaiz1/cmp_luasnip'

    use 'hrsh7th/cmp-nvim-lsp'

    use 'hrsh7th/cmp-nvim-lua'

    -- Snippets

    use 'L3MON4D3/LuaSnip'

    use 'rafamadriz/friendly-snippets'

    -- LSP

    use 'neovim/nvim-lspconfig'

    use 'williamboman/mason-lspconfig.nvim'

    use 'williamboman/mason.nvim'

    use 'jay-babu/mason-nvim-dap.nvim'

    use 'ray-x/lsp_signature.nvim'

    -- Linting

    use 'jose-elias-alvarez/null-ls.nvim'

    -- DAP

    use 'mfussenegger/nvim-dap'

    use 'mfussenegger/nvim-dap-python'

    use 'theHamsta/nvim-dap-virtual-text'

    use 'rcarriga/nvim-dap-ui'

    -- Telescope

    use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' } } }

    use 'nvim-telescope/telescope-dap.nvim'

    -- Git & comments

    use 'lewis6991/gitsigns.nvim'

    use 'b3nj5m1n/kommentary'

    -- Languages & tools

    use 'simrat39/rust-tools.nvim'

    -- Copilot

    use {
      "zbirenbaum/copilot.lua",
      after = "feline.nvim",
      config = function ()
        vim.defer_fn(function()
          require("copilot").setup()
        end, 100)
      end,
    }

    -- use 'zbirenbaum/copilot-cmp'

    use {
      "zbirenbaum/copilot-cmp",
      after = { "copilot.lua" },
      config = function ()
        require("copilot_cmp").setup()
      end
    }

    -- Dadbod UI

    -- use 'tpope/vim-dadbod'

    -- use 'kristijanhusak/vim-dadbod-ui'

    --
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
