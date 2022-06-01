local filename = require("tabby.filename")
local util = require("tabby.util")
local ui = require('ui.utils')

local cwd = function()
  return "  " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " "
end

-- ֍ ֎ 

local line = {
  hl = "TabLineFill",
  layout = "active_wins_at_tail",
  head = {
    { cwd, hl = ui.groups.TLHead },
    { "", hl = ui.groups.TLHeadSep },
  },
  active_tab = {
    label = function(tabid)
      return {
        "  " .. tabid .. " ",
        hl = ui.groups.TLActive,
      }
    end,
    left_sep = { "", hl = ui.groups.TLActiveSep },
    right_sep = { "", hl = ui.groups.TLActiveSep },
  },
  inactive_tab = {
    label = function(tabid)
      return {
        "  " .. tabid .. " ",
        hl = ui.groups.TLBoldLine,
      }
    end,
    left_sep = { "", hl = ui.groups.TLLineSep },
    right_sep = { "", hl = ui.groups.TLLineSep },
  },
  top_win = {
    label = function(winid)
      return {
        "  " .. filename.unique(winid) .. " ",
        hl = "TabLine",
      }
    end,
    left_sep = { "", hl = ui.groups.TLLineSep },
    right_sep = { "", hl = ui.groups.TLLineSep },
  },
  win = {
    label = function(winid)
      return {
        "  " .. filename.unique(winid) .. " ",
        hl = "TabLine",
      }
    end,
    left_sep = { "", hl = ui.groups.TLLineSep },
    right_sep = { "", hl = ui.groups.TLLineSep },
  },
  tail = {
    { "", hl = ui.groups.TLHeadSep },
    { "  ", hl = ui.groups.TLHead },
  },
}

require("tabby").setup({ tabline = line })
