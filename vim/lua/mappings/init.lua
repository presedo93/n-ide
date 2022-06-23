require('which-key').setup {
    key_labels = {
        ["<space>"] = "SPC",
        ["<cr>"] = "RET",
        ["<tab>"] = "TAB",
        ["<F2>"] = "F2",

        ["<C-T>"] = "Ctrl + T",

        ["<C-J>"] = "Ctrl + J",
        ["<C-K>"] = "Ctrl + K",
        ["<C-H>"] = "Ctrl + H",
        ["<C-L>"] = "Ctrl + L",

        ["<M-Down>"] = "Alt + Down",
        ["<M-Up>"] = "Alt + Up",
        ["<M-Right>"] = "Alt + Right",
        ["<M-Left>"] = "Alt + Left",

        ["<S-Down>"] = "Shift + Down",
        ["<S-Up>"] = "Shift + Up",
        ["<S-Right>"] = "Shift + Right",
        ["<S-Left>"] = "Shift + Left",

        ["<M-,>"] = "Alt + ,",
        ["<M-.>"] = "Alt + .",

        ["<M-j>"] = "Alt + j",
        ["<M-k>"] = "Alt + k",

        ["<M-#>"] = "Alt + #",
        ["<M-*>"] = "Alt + *",

        ["<leader>"] = "Space",
        ["<c-w>"] = "Ctrl + w",
    },
}

require('mappings.basics')
require('mappings.leader')
require('mappings.lsp')
require('mappings.dap')

vim.g.mapleader = ' '
