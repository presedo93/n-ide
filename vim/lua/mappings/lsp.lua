local wk = require('which-key')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    wk.register(
        {
            ['g'] = {
                name = 'LSP shortcuts',
                ['d'] = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'LSP -> Go to definition' },
                ['i'] = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'LSP -> Go to implementation' },
                ['r'] = { '<cmd>lua vim.lsp.buf.references()<CR>', 'LSP -> Go to references' },
            },
            ['<leader>'] = {
                ['D'] = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'LSP -> Type definition' },
                ['rn'] = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'LSP -> Rename' },
                ['ca'] = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'LSP -> Code Action' },
                ['f'] = {
                    ['c'] = {'<cmd>lua vim.lsp.buf.formatting()<CR>', 'LSP -> Formatting' },
                },
            },
            ['K'] = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'LSP -> Hover' }
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

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
require("nvim-lsp-installer").setup{}
local servers = { 'clangd', 'pyright', 'rust_analyzer', 'tailwindcss', 'tsserver' }

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
  }
end
