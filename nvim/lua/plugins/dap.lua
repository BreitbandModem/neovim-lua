local dap = require('dap')
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  initialize_timeout_sec = 10,
  args = {os.getenv('HOME') .. '/git/vscode-node-debug2/out/src/nodeDebug.js'},
}
dap.configurations.typescript = {
  {
    type = "node2",
    request = "attach",
    name = "Docker: Attach to Node",
    protocol = "inspector",
    console = 'integratedTerminal',
    port = 9229,
    restart = true,
    sourceMaps = true,
    address = "localhost",
    localRoot = "${workspaceFolder}",
    remoteRoot = "/app",
    timeout = 50000,
    showAsyncStacks = true,
    sourceMapPathOverrides = {
      ['/app/*'] = "${workspaceFolder}/*"
    },
    skipFiles = {
      "/app/node_modules/**/*.js",
      "<node_internals>/**/*.js"
    }
  },
  {
    type = "node2",
    request = "attach",
    name = "Docker: Attach to Worker",
    protocol = "inspector",
    console = 'integratedTerminal',
    port = 9230,
    restart = true,
    sourceMaps = true,
    address = "localhost",
    localRoot = "${workspaceFolder}",
    remoteRoot = "/app",
    timeout = 50000,
    showAsyncStacks = true,
    sourceMapPathOverrides = {
      ['/app/*'] = "${workspaceFolder}/*"
    },
    skipFiles = {
      "/app/node_modules/**/*.js",
      "<node_internals>/**/*.js"
    }
  },
}

vim.g.dap_test_configuration = {
    type = "node2",
    request = "attach",
    name = "Docker: Attach to Tests",
    protocol = "inspector",
    console = 'integratedTerminal',
    port = 9228,
    restart = true,
    sourceMaps = true,
    address = "localhost",
    localRoot = "${workspaceFolder}",
    remoteRoot = "/app",
    timeout = 300000,
    showAsyncStacks = true,
    sourceMapPathOverrides = {
      ['/app/*'] = "${workspaceFolder}/*"
    },
    skipFiles = {
      "/app/node_modules/**/*.js",
      "<node_internals>/**/*.js"
    },
  }

local dapui = require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
    dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
    dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end