return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<leader>cl", "<cmd>:lua vim.lsp.codelens.run()<cr>", desc = "Code Lens Run" }
  end,
  opts = {
    inlay_hints = { enabled = true },
    servers = {
      eslint = {},
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              features = { "all" },
            },
          },
        },
      },
    },
    setup = {
      eslint = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "tsserver" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
    },
  },
}
