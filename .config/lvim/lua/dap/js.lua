
local dap = require('dap')

-- Configure node2 adapter
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/.local/share/nvim/dap-adapters/vscode-node-debug2/out/src/nodeDebug.js' },
}

-- Configure the JavaScript/Node.js debugger for launch configuration
dap.configurations.javascript = {
  {
    type = 'node2',
    request = 'launch',
    program = '${file}',  -- This launches the current file
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
}

-- DAP configurations for TypeScript React
dap.configurations.typescriptreact = {
  {
    type = 'node2',
    request = 'launch',
    program = '${file}',  -- Debug the current file
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
    outFiles = { '${workspaceFolder}/dist/**/*.js' }, -- Adjust this according to your setup
    runtimeExecutable = "node",  -- Ensure Node.js is used
    skipFiles = { "<node_internals>/**" },
  },
}
