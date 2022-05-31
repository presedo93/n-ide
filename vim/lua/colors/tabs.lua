local filename = require("tabby.filename")
-- local colors = require("colors.colors")
local util = require("tabby.util")
local colors = require('colors.util')

local cwd = function()
  return "  " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " "
end

-- ֍ ֎ 

local line = {
  hl = "TabLineFill",
  layout = "active_wins_at_tail",
  head = {
    { cwd, hl = colors.groups.TLHead },
    { "", hl = colors.groups.TLHeadSep },
  },
  active_tab = {
    label = function(tabid)
      return {
        "  " .. tabid .. " ",
        hl = colors.groups.TLActive,
      }
    end,
    left_sep = { "", hl = colors.groups.TLActiveSep },
    right_sep = { "", hl = colors.groups.TLActiveSep },
  },
  inactive_tab = {
    label = function(tabid)
      return {
        "  " .. tabid .. " ",
        hl = colors.groups.TLBoldLine,
      }
    end,
    left_sep = { "", hl = colors.groups.TLLineSep },
    right_sep = { "", hl = colors.groups.TLLineSep },
  },
  top_win = {
    label = function(winid)
      return {
        "  " .. filename.unique(winid) .. " ",
        hl = "TabLine",
      }
    end,
    left_sep = { "", hl = colors.groups.TLLineSep },
    right_sep = { "", hl = colors.groups.TLLineSep },
  },
  win = {
    label = function(winid)
      return {
        "  " .. filename.unique(winid) .. " ",
        hl = "TabLine",
      }
    end,
    left_sep = { "", hl = colors.groups.TLLineSep },
    right_sep = { "", hl = colors.groups.TLLineSep },
  },
  tail = {
    { "", hl = colors.groups.TLHeadSep },
    { "  ", hl = colors.groups.TLHead },
  },
}

require("tabby").setup({ tabline = line })
