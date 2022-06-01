local fmt = string.format

local M = { vi = {} }

M.groups = {
    StatusLine = { bg = "#131a24", fg = "#aeafb0", style = "NONE" },
    SLAlt = { bg = "#39506d", fg = "#aeafb0", style = "NONE" },
    SLAltSep = { bg = "#39506d", fg = "#131a24" },
    SLError = { bg = "#c94f6d", fg = "#131a24", style = "bold" },
    SLErrorStatus = { bg = "#dfdfe0", fg = "#c94f6d" },
    SLFtHint = { bg = "#81b29a", fg = "#39506d" },
    SLGitBranch = { bg = "#131a24", fg = "#dbc074" },
    SLHint = { bg = "#81b29a", fg = "#131a24", style = "bold" },
    SLHintInfo = { bg = "#719cd6", fg = "#81b29a" },
    SLInfo = { bg = "#719cd6", fg = "#131a24", style = "bold" },
    SLInfoWarn = { bg = "#dbc074", fg = "#719cd6" },
    SLStatus = { bg = "#dfdfe0", fg = "#393b44", style = "bold" },
    SLStatusBg = { bg = "#131a24", fg = "#dfdfe0" },
    SLWarn = { bg = "#dbc074", fg = "#131a24", style = "bold" },
    SLWarnError = { bg = "#c94f6d", fg = "#dbc074" },
    TLActive = { bg = "#39506d", fg = "#aeafb0", style = "bold" },
    TLActiveSep = { bg = "#131a24", fg = "#39506d" },
    TLBoldLine = { bg = "#212e3f", fg = "#71839b", style = "bold" },
    TLHead = { bg = "#63cdcf", fg = "#131a24" },
    TLHeadSep = { bg = "#131a24", fg = "#63cdcf" },
    TLLineSep = { bg = "#131a24", fg = "#212e3f" }
}

M.colors = {
    Black = { bg = "#dfdfe0", fg = "#393b44", style = "bold" },
    Blue = { bg = "#131a24", fg = "#719cd6", style = "bold" },
    Cyan = { bg = "#131a24", fg = "#63cdcf", style = "bold" },
    Green = { bg = "#131a24", fg = "#81b29a", style = "bold" },
    Magenta = { bg = "#131a24", fg = "#9d79d6", style = "bold" },
    Red = { bg = "#131a24", fg = "#c94f6d", style = "bold" },
    RvBlack = { bg = "#393b44", fg = "#dfdfe0", style = "bold" },
    RvBlue = { bg = "#719cd6", fg = "#131a24", style = "bold" },
    RvCyan = { bg = "#63cdcf", fg = "#131a24", style = "bold" },
    RvGreen = { bg = "#81b29a", fg = "#131a24", style = "bold" },
    RvMagenta = { bg = "#9d79d6", fg = "#131a24", style = "bold" },
    RvRed = { bg = "#c94f6d", fg = "#131a24", style = "bold" },
    RvWhite = { bg = "#dfdfe0", fg = "#393b44", style = "bold" },
    RvYellow = { bg = "#dbc074", fg = "#131a24", style = "bold" },
    White = { bg = "#393b44", fg = "#dfdfe0", style = "bold" },
    Yellow = { bg = "#131a24", fg = "#dbc074", style = "bold" }
}

M.vi.text = {
  n = "NORMAL",
  no = "NORMAL",
  i = "INSERT",
  v = "VISUAL",
  V = "V-LINE",
  [""] = "V-BLOCK",
  c = "COMMAND",
  cv = "COMMAND",
  ce = "COMMAND",
  R = "REPLACE",
  Rv = "REPLACE",
  s = "SELECT",
  S = "SELECT",
  [""] = "SELECT",
  t = "TERMINAL",
}

M.vi.colors = {
  n = M.colors.RvCyan,
  no = M.colors.RvCyan,
  i = M.groups.SLStatus,
  v = M.colors.RvMagenta,
  V = M.colors.RvMagenta,
  [""] = M.colors.RvMagenta,
  R = M.colors.RvRed,
  Rv = M.colors.RvRed,
  r = M.colors.RvBlue,
  rm = M.colors.RvBlue,
  s = M.colors.RvMagenta,
  S = M.colors.RvMagenta,
  [""] = M.colors.Magenta,
  c = M.colors.RvYellow,
  ["!"] = M.colors.RvBlue,
  t = M.colors.RvBlue,
}

M.vi.sep = {
  n = M.colors.Cyan,
  no = M.colors.Cyan,
  i = M.groups.SLStatusBg,
  v = M.colors.Magenta,
  V = M.colors.Magenta,
  [""] = M.colors.Magenta,
  R = M.colors.Red,
  Rv = M.colors.Red,
  r = M.colors.Blue,
  rm = M.colors.Blue,
  s = M.colors.Magenta,
  S = M.colors.Magenta,
  [""] = M.colors.Magenta,
  c = M.colors.Yellow,
  ["!"] = M.colors.Blue,
  t = M.colors.Blue,
}

M.icons = {
  locker = "", -- #f023
  page = "☰", -- 2630
  line_number = "", -- e0a1
  connected = "", -- f817
  dos = "", -- e70f
  unix = "", -- f17c
  mac = "", -- f179
  mathematical_L = "𝑳",
  vertical_bar = "┃",
  vertical_bar_thin = "│",
  left = "",
  right = "",
  block = "█",
  left_filled = "",
  right_filled = "",
  slant_left = "",
  slant_left_thin = "",
  slant_right = "",
  slant_right_thin = "",
  slant_left_2 = "",
  slant_left_2_thin = "",
  slant_right_2 = "",
  slant_right_2_thin = "",
  left_rounded = "",
  left_rounded_thin = "",
  right_rounded = "",
  right_rounded_thin = "",
  circle = "●",
}

return M
