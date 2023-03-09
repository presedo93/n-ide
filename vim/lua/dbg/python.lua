-- In order to launch it: pip install debugpy
require('dap-python').setup('~/.pyenv/versions/taf/bin/python')
require('dap-python').test_runner = 'pytest'
