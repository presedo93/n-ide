require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false,
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = { "italic" },
        keywords = {},
        strings = { "italic" },
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = { "bold" },
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        barbecue = {
          dim_dirname = true,
          bold_basename = true,
          dim_context = false,
        }
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

-- Telescope tabpages
require('telescope-tabs').setup({
  entry_formatter = function(tab_id, buffer_ids, file_names, file_paths, is_current)
	  local entry_string = table.concat(file_names, "  ")
	  return string.format('%d: %s%s', tab_id, entry_string, is_current and ' <~~' or '')
  end,
})

-- Feline
require('ui.feline')

-- Barbecue
vim.opt.updatetime = 200

require("barbecue").setup({
  theme = "catppuccin",
  create_autocmd = false, -- prevent barbecue from updating itself automatically
  symbols = {
    separator = "~>"
  }
})

vim.api.nvim_create_autocmd({
  "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
  "BufWinEnter",
  "CursorHold",
  "InsertLeave",

  -- include this if you have set `show_modified` to `true`
  "BufModifiedSet",
}, {
  group = vim.api.nvim_create_augroup("barbecue.updater", {}),
  callback = function()
    require("barbecue.ui").update()
  end,
})

-- Colors and auto close pairs
require('nvim-autopairs').setup({
    check_ts = true,
    ts_config = {
        lua = { 'string' },
        javascript = { 'template_string' },
        java = false,
    },
    disable_filetype = { 'TelescopePrompt' }
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

-- Highlight arguments
require('hlargs').setup()

-- Surround
require('nvim-surround').setup({
    keymaps = {
        delete = "Cs"
    }
})

-- UFO
require('ufo').setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end
})

-- TO-DO
require('todo-comments').setup()

-- Colorizer
require('colorizer').setup()

-- Outline
require('symbols-outline').setup()

-- Yanky
require('yanky').setup()

-- Notify
require('notifier').setup()

-- Dressing
require('dressing').setup()
