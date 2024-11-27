return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    opts.options.show_buffer_close_icons = true
    opts.options.separator_style = { "", "" }
  end,
}
