-- Debugger
return {
  {
    'mfussenegger/nvim-dap',
    config = function ()
      local dap = require('dap')
      dap.configurations.typescript = {
        {
          type = "pwa-node",
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
            "/app/server/node_modules/**/*.js",
            "<node_internals>/**/*.js"
          }
        },
        {
          type = "pwa-node",
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
            "/app/server/node_modules/**/*.js",
            "<node_internals>/**/*.js"
          }
        },
      }
      dap.configurations.javascript = dap.configurations.typescript

      vim.g.dap_test_configuration = {
          type = "pwa-node",
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
            "/app/server/node_modules/**",
            "<node_internals>/**",
            "/app/server/<node_internals>/**",
            "${workspaceFolder}/<node_internals>/**",
            "${workspaceFolder}/node_modules/**"
          },
        }
    end
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap' },
    config = function ()
      local dap = require('dap')
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
    end
  },
  {
    'mxsdev/nvim-dap-vscode-js',
    dependencies = {'mfussenegger/nvim-dap'},
    opts = {
      -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
      debugger_path = vim.fn.stdpath('data') .. '/lazy/vscode-js-debug',
      -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
      adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
      -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
      -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
      -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
    },
  },
  {
    'microsoft/vscode-js-debug',
    lazy = true,
    build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
  }
}
