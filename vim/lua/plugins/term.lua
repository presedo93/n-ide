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
      width = 160,
      height = 30,
      winblend = 0,
      highlights = {
        border = "Special",
        background = "Normal",
      },
    },
}
