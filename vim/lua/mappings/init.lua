local map = vim.api.nvim_set_keymap
local buf_map = vim.api.nvim_buf_set_keymap
local buf_opt = vim.api.nvim_buf_set_option
local opts = { noremap = true, silent = true } 

vim.g.mapleader = ' '

-- Save and exit
map('n', 'q', ':w<CR>', opts)
map('n', '<esc><esc>', ':q<CR>', opts)

-- Change split
map('n', '<C-J>', '<C-W><C-J>', opts)
map('n', '<C-K>', '<C-W><C-K>', opts)
map('n', '<C-L>', '<C-W><C-L>', opts)
map('n', '<C-H>', '<C-W><C-H>', opts)

-- Move split
map('n', '<S-Up>', '<C-W>K', opts)
map('n', '<S-Down>', '<C-W>J', opts)
map('n', '<S-Right>', '<C-W>L', opts)
map('n', '<S-Left>', '<C-W>H', opts)

-- Resize split
map('n', '<M-Up>', '<C-W>-', opts)
map('n', '<M-Down>', '<C-W>+', opts)
map('n', '<M-C-Right>', '<C-W>>', opts)
map('n', '<M-Left>', '<C-W><', opts)

-- Move lines
map('n', '<M-j>', ':m .+1<CR>==', opts)
map('i', '<M-j>', '<Esc>:m .+1<CR>==gi', opts)
map('v', '<M-j>', ":m '>+1<CR>gv=gv", opts)
map('n', '<M-k>', ':m .-2<CR>==', opts)
map('i', '<M-k>', '<Esc>:m .-2<CR>==gi', opts)
map('v', '<M-k>', ":m '<-2<CR>gv=gv", opts)

-- Delete and copy
map('n', 'x', '"_x', opts)
map('n', 'd', '"_d', opts)
map('v', 'd', '"_d', opts)
map('n', 'D', '"_D', opts)

map('n', '<leader>d', '"+d', opts)
map('v', '<leader>d', '"+d', opts)
map('n', '<leader>D', '"+D', opts)

map('n', '<leader>y', '"+y', opts)
map('v', '<leader>y', '"+y', opts)

-- Nvim Tree
map('n', '<F2>', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>r', ':NvimTreeRefresh<CR>', opts)
map('n', '<leader>n', ':NvimTreeFindFile<CR>', opts)

-- tabby
map('n', '<leader>t', ':$tabnew<CR>', opts)
map('n', '<M-.>', ':tabn<CR>', opts)
map('n', '<M-,>', ':tabp<CR>', opts)

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
map('n', '<leader>fb', ':Telescope buffers<CR>', opts)

map('n', '<leader>gc', ':Telescope git_commits<CR>', opts)
map('n', '<leader>gs', ':Telescope git_status<CR>', opts)
map('n', '<leader>ts', ':Telescope treesitter<CR>', opts)

-- LSP
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  buf_opt(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_map(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_map(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_map(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_map(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_map(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_map(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_map(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_map(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
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
