local filename = require("tabby.filename")
local clrs = require("catppuccin.palettes").get_palette()

local active = { bg = "#39506D", fg = "#AEAFB0", style = "bold" }
local active_sep = { fg = "#39506d" }
local bold_line = { bg = "#212E3F", fg = "#71839B", style = "bold" }
local line_sep = { fg = "#212E3F" }

-- ֍ ֎ 

local line = {
  hl = "TabLineFill",
  layout = "active_wins_at_tail",
  active_tab = {
    label = function(tabid)
      return {
        "  ",
        hl = active,
      }
    end,
    left_sep = { "", hl = active_sep },
    right_sep = { " ", hl = active_sep },
  },
  inactive_tab = {
    label = function(tabid)
      return {
        "  ",
        hl = bold_line,
      }
    end,
    left_sep = { "", hl = line_sep },
    right_sep = { " ", hl = line_sep },
  },
  top_win = {
    label = function(winid)
      return {
        "  " .. filename.unique(winid) .. " ",
        hl = "TabLine",
      }
    end,
    left_sep = { " ", hl = line_sep },
    right_sep = { " ", hl = line_sep },
  },
  win = {
    label = function(winid)
      return {
        "  " .. filename.unique(winid) .. " ",
        hl = "TabLine",
      }
    end,
    left_sep = { " ", hl = line_sep },
    right_sep = { " ", hl = line_sep },
  },
}

require("tabby").setup({ tabline = line })
