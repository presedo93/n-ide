local u = require("ui.utils")
local fmt = string.format

-- "┃", "█", "", "", "", "", "", "", "●"

local get_diag = function(str)
  local diagnostics = vim.diagnostic.get(0, { severity = vim.diagnostic.severity[str] })
  local count = #diagnostics

  return (count > 0) and " " .. count .. " " or " 0 "
end

local function vi_mode_hl()
  return u.vi.colors[vim.fn.mode()]
end

local function vi_sep_hl()
  return u.vi.sep[vim.fn.mode()]
end

local c = {
  vimode = {
    provider = function()
      return string.format(" %s ", u.vi.text[vim.fn.mode()])
    end,
    hl = vi_mode_hl,
    right_sep = { str = " ", hl = vi_sep_hl },
  },
  gitbranch = {
    provider = "git_branch",
    icon = " ",
    hl = u.groups.SLGitBranch,
    right_sep = { str = "  ", hl = u.groups.SLGitBranch },
    enabled = function()
      return vim.b.gitsigns_status_dict ~= nil
    end,
  },
  file_type = {
    provider = function()
      return fmt(" %s ", vim.bo.filetype:upper())
    end,
    hl = u.groups.SLAlt,
  },
  fileinfo = {
    provider = { name = "file_info", opts = { type = "base-only" } },
    hl = u.groups.SLAlt,
    left_sep = { str = " ", hl = u.groups.SLAltSep },
    right_sep = { str = " ", hl = u.groups.SLAltSep },
  },
  file_enc = {
    provider = function()
      local os = u.icons[vim.bo.fileformat] or ""
      return fmt(" %s %s ", os, vim.bo.fileencoding)
    end,
    hl = u.groups.StatusLine,
    -- left_sep = { str = u.icons.left_filled, hl = u.groups.SLAltSep },
  },
  cur_position = {
    provider = function()
      -- TODO: What about 4+ diget line numbers?
      return fmt("%3d:%-2d ", unpack(vim.api.nvim_win_get_cursor(0)))
    end,
    hl = vi_mode_hl,
    left_sep = { str = u.icons.left_filled, hl = vi_sep_hl },
  },
  cur_percent = {
    provider = function()
      return " " .. require("feline.providers.cursor").line_percentage() .. "  "
    end,
    hl = vi_mode_hl,
    left_sep = { str = u.icons.left, hl = vi_mode_hl },
  },
  default = { -- needed to pass the parent StatusLine hl group to right hand side
    provider = "",
    hl = u.groups.StatusLine,
  },
  lsp_status = {
    provider = function()
      return require("nvim-gps").get_location()
    end,
    enabled = function()
		return require("nvim-gps").is_available()
	end,
    hl = u.groups.SLStatus,
    left_sep = { str = "", hl = u.groups.SLStatusBg, always_visible = true },
    right_sep = { str = "", hl = u.groups.SLErrorStatus, always_visible = true },
  },
  lsp_error = {
    provider = function()
      return get_diag("ERROR")
    end,
    hl = u.groups.SLError,
    right_sep = { str = "", hl = u.groups.SLWarnError, always_visible = true },
  },
  lsp_warn = {
    provider = function()
      return get_diag("WARN")
    end,
    hl = u.groups.SLWarn,
    right_sep = { str = "", hl = u.groups.SLInfoWarn, always_visible = true },
  },
  lsp_info = {
    provider = function()
      return get_diag("INFO")
    end,
    hl = u.groups.SLInfo,
    right_sep = { str = "", hl = u.groups.SLHintInfo, always_visible = true },
  },
  lsp_hint = {
    provider = function()
      return get_diag("HINT")
    end,
    hl = u.groups.SLHint,
    right_sep = { str = "", hl = u.groups.SLFtHint, always_visible = true },
  },

  in_fileinfo = {
    provider = "file_info",
    hl = u.groups.StatusLine,
  },
  in_position = {
    provider = "position",
    hl = u.groups.StatusLine,
  },
}

local active = {
  { -- left
    c.vimode,
    c.gitbranch,
    c.fileinfo,
    c.default, -- must be last
  },
  { -- right
    c.lsp_status,
    c.lsp_error,
    c.lsp_warn,
    c.lsp_info,
    c.lsp_hint,
--    c.file_type,
   c.file_enc,
    c.cur_position,
    c.cur_percent,
  },
}

local inactive = {
  { c.in_fileinfo }, -- left
  { c.in_position }, -- right
}

require("feline").setup({
  components = { active = active, inactive = inactive },
  highlight_reset_triggers = {},
  force_inactive = {
    filetypes = {
      "NvimTree",
      "packer",
      "dap-repl",
      "dapui_scopes",
      "dapui_stacks",
      "dapui_watches",
      "dapui_repl",
      "LspTrouble",
      "qf",
      "help",
    },
    buftypes = { "terminal" },
    bufnames = {},
  },
  disable = {
    filetypes = {
      "dashboard",
      "startify",
    },
  },
})
