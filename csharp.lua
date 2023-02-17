local dap = require('dap')

-- Debugger installation location
local HOME = os.getenv "HOME"
local DEBUGGER_LOCATION = HOME .. "/nvim-data/mason/packages/netcoredbg/netcoredbg"

dap.adapters.coreclr = 
{
    type = "executable",
    command = DEBUGGER_LOCATION .. "/netcoredbg.exe",
    args = { "--interpreter=vscode"},
}

dap.configurations.cs = 
{
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to dll', vim.fn.getswd() .. '/bin/Debug/','file')
    end,
  },
}

