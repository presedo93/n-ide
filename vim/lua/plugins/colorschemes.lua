return {
  { "tiagovla/tokyodark.nvim", priority = 1000, lazy = false, opts = { transparent_background = true } },
  { "catppuccin/nvim", priority = 1000, lazy = false, opts = { transparent_background = true } },
  { "sontungexpt/witch", priority = 1000, lazy = false },
  { "rebelot/kanagawa.nvim", priority = 1000, lazy = false, opts = { transparent = true } },
  { "rose-pine/neovim", priority = 1000, name = "rose-pine" },
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
      on_highlights = function(hl, c)
        -- remove rust-analyzer unresolved reference underline
        hl["@lsp.type.unresolvedReference"] = {
          fg = c.text,
          bg = "NONE",
          underline = false,
          undercurl = false,
          sp = "NONE",
        }

        hl["@lsp.type.unresolvedReference.rust"] = {
          fg = c.text,
          bg = "NONE",
          underline = false,
          undercurl = false,
          sp = "NONE",
        }
      end,
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
