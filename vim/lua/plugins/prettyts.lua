-- npm install -g pretty-ts-errors-markdown
return {
  {
    "youyoumu/pretty-ts-errors.nvim",
    opts = {
      executable = "pretty-ts-errors-markdown",
      float_opts = {
        border = "rounded",
        max_width = 80,
        max_height = 20,
      },
      auto_open = true,
    },
  },
}
