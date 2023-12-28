return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    opts.options.always_show_bufferline = true
    opts.options.show_buffer_close_icons = false
  end,
}
