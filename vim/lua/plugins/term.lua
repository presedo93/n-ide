require('toggleterm').setup {
    open_mapping = [[<F3>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    start_in_insert = true,
    persist_size = true,
    direction = 'float',
    close_on_exit = true,
    float_opts = {
      border = "curved",
      width = 200,
      height = 40,
      winblend = 0,
      highlights = {
        border = "Special",
        background = "Normal",
      },
    },
}

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc><esc>', [[<C-\><C-n>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd.autocmd("TermOpen term://* lua set_terminal_keymaps()")
