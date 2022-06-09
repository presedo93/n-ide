local wk = require('which-key')

wk.register(
    {
        d = {
          name = "DAP -> Debug",
          -- ['e'] = { "<cmd>lua require'dapui'.eval(vim.fn.input '[expression] > ')<cr>", "evaluate input" },
          -- ['c'] = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[condition] > ')<cr>", "conditional breakpoint" },
          ['t'] = { "<cmd>lua require'dapui'.toggle()<cr>", "toggle ui" },
          ['e'] = { "<cmd>lua require'dapui'.eval()<cr>", "evaluate" },

          ['c'] = { "<cmd>lua require'dap'.continue()<cr>", "continue" },
          ['d'] = { "<cmd>lua require'dap'.disconnect()<cr>", "disconnect" },
          ['g'] = { "<cmd>lua require'dap'.session()<cr>", "get session" },
          ['h'] = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "hover variables" },
          ['s'] = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "scopes" },

          ['i'] = { "<cmd>lua require'dap'.step_into()<cr>", "step into" },
          ['o'] = { "<cmd>lua require'dap'.step_over()<cr>", "step over" },
          ['u'] = { "<cmd>lua require'dap'.step_out()<cr>", "step out" },

          ['r'] = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "run to cursor" },
          ['p'] = { "<cmd>lua require'dap'.pause.toggle()<cr>", "pause" },
          ['q'] = { "<cmd>lua require'dap'.close()<cr>", "quit" },

          ['b'] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "toggle breakpoint" },
          ['R'] = { "<cmd>lua require'dap'.repl.toggle()<cr>", "toggle repl" },
          ['X'] = { "<cmd>lua require'dap'.terminate()<cr>", "terminate" },
        },
        c = {
            name = 'DAP -> Telescope',
            ['c'] = { '<cmd>lua require"telescope".extensions.dap.commands{}<CR>', 'List commands' },
            ['o'] = { '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>', ' List configurations' },
            ['b'] = { '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>', 'List breakpoints' },
            ['v'] = { '<cmd>lua require"telescope".extensions.dap.variables{}<CR>', 'List variables' },
            ['f'] = { '<cmd>lua require"telescope".extensions.dap.frames{}<CR>', 'List frames' },
        }
    },
    {
        mode = "n",
        prefix = "<leader>",
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = false,
    }
)

-- Dap -> v
wk.register(
    {
        name = "DAP -> Debug",
        e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
    },
    {
        mode = "v",
        prefix = "<leader>",
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = false,
    }
)
