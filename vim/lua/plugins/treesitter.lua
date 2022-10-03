require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "python", "go", "typescript", "tsx", "lua", "ruby", "rust", "glimmer" },
    highlight = {
        enable = true,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    autotag = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    context_commentstring = {
        enable = true
    },
    refactor = {
        highlight_definitions = { enable = true },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = 'grr'
            },
        },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = 'gnd',
                list_definitions = 'gnD',
                list_definitions_toc = 'gO',
                goto_next_usage = '<M-*>',
                goto_previous_usage = '<M-#>'
            },
        },
    },
}

require("nvim-gps").setup()
