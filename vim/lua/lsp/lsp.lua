local wk = require('which-key')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    if client.name == 'tsserver' then
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
    end
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    wk.register(
        {
            ['g'] = {
                name = 'LSP shortcuts',
                ['d'] = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'LSP -> Go to definition' },
                ['i'] = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'LSP -> Go to implementation' },
                ['r'] = { '<cmd>lua vim.lsp.buf.references()<CR>', 'LSP -> Go to references' },
                ['k'] = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'LSP -> Signature help' },
                ['l'] = { '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', 'LSP -> Line diagnistics' },
            },
            ['<leader>'] = {
                ['d'] = { '<cmd>lua vim.diagnostic.setloclist()<CR>', 'LSP -> list diagnistics' },
                ['D'] = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'LSP -> Type definition' },
                ['rn'] = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'LSP -> Rename' },
                ['ca'] = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'LSP -> Code Action' },
                ['f'] = {
                    ['c'] = { '<cmd>lua vim.lsp.buf.format{ async = true }<CR>', 'LSP -> Formatting' },
                },
                ['[d'] = { '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', 'LSP -> go to prev' },
                [']d'] = { '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', 'LSP -> go to next' },
            },
            ['K'] = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'LSP -> Hover' },
        },
        {
            mode = 'n',
            buffer = bufnr,
            silent = true,
            noremap = true,
            nowait = false
        }
    )
end

local signs = {
    { name = "DiagnosticSignError", text = "???" },
    { name = "DiagnosticSignWarn", text = "???" },
    { name = "DiagnosticSignHint", text = "???" },
    { name = "DiagnosticSignInfo", text = "???" },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
        active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
}

-- Load the previous config
vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
require("nvim-lsp-installer").setup {}
local servers = { 'clangd', 'pyright', 'rust_analyzer', 'sumneko_lua', 'tailwindcss', 'tsserver' }

local severs_configs = require('lsp.servers')

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        flags = {
            -- This will be the default in neovim 0.7+
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
        settings = severs_configs.load(lsp),
    }
end
