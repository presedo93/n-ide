return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        -- floats = "transparent",
      },
      on_colors = function(colors)
        colors.border = "#565f89"
      end,
    },
  },
}
