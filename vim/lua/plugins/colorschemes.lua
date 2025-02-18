return {
  { "tiagovla/tokyodark.nvim", priority = 1000, lazy = false },
  { "scottmckendry/cyberdream.nvim", priority = 1000, lazy = false },
  { "sontungexpt/witch", priority = 1000, lazy = false },
  { "rebelot/kanagawa.nvim", priority = 1000, lazy = false, opts = {
    transparent = true,
  } },
  { "xero/evangelion.nvim", priority = 1000, lazy = false },
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
        borders = "fluo", -- "theme" | "inverse" | "fluo" | "none"
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
