require('telescope').load_extension('dap')

-- Basic config
require('nvim-dap-virtual-text').setup()
require('dapui').setup()
require('dap-install').setup{ installation_path = vim.fn.stdpath 'data' .. '/dapinstall/' }

-- UI
local dap_breakpoint = {
    error = {
        text = '',
        texthl = 'LspDiagnosticsSignError',
        linehl = '',
        numhl = '',
    },
    rejected = {
        text = '',
        texthl = 'LspDiagnosticsSignHint',
        linehl = '',
        numhl = '',
    },
    stopped = {
        text = 'ﰲ',
        texthl = 'LspDiagnosticsSignInformation',
        linehl = 'DiagnosticUnderlineInfo',
        numhl = 'LspDiagnosticsSignInformation',
    },
}

vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)
vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)

-- Configure debuggers
require('dbg.python')
require('dbg.rust')
-- require('debug.go').setup()
