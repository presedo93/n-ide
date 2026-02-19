return {
  { "tiagovla/tokyodark.nvim", priority = 1000, lazy = false, opts = { transparent_background = true } },
  { "catppuccin/nvim", priority = 1000, lazy = false, opts = { transparent_background = true } },
  { "sontungexpt/witch", priority = 1000, lazy = false },
  { "rebelot/kanagawa.nvim", priority = 1000, lazy = false, opts = { transparent = true } },
  {
    "eldritch-theme/eldritch.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      palette = "default",
      transparent = true,
      styles = {
        sidebars = "transparent",
      },
    },
  },
  {
    "0xstepit/flow.nvim",
    opts = {
      theme = {
        style = "dark", --  "dark" | "light"
        contrast = "high", -- "default" | "high"
        transparent = true, -- true | false
      },
      colors = {
        mode = "default", -- "default" | "dark" | "light"
        fluo = "cyan", -- "pink" | "cyan" | "yellow" | "orange" | "green"
      },
      ui = {
        borders = "light", -- "theme" | "inverse" | "fluo" | "none"
        aggressive_spell = true, -- true | false
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
      },
    },
  },
}
