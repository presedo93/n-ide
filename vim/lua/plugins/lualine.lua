return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    opts.sections.lualine_z = {}
    opts.options.theme = "auto"
    -- opts.options.section_separators = { left = "", right = "" }
  end,
}
