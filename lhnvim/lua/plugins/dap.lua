-- Debugger
return {
  {
    'mfussenegger/nvim-dap',
    keys = {
      { "<leader>db", ":lua require'dap'.toggle_breakpoint()<cr>", desc="Breakpoint" },
      { "<leader>dc", ":lua require'dap'.continue()<cr>", desc="Attach/Continue" },
      { "<leader>dd", ":lua require'dap'.disconnect()<cr>", desc="Detach" },
      { "<leader>de", ":lua require'dapui'.eval()<cr>", desc="Eval" },
      { "<leader>di", ":lua require'dap'.step_into()<cr>", desc="Step Into" },
      { "<leader>dl", ":lua require'dap'.run_to_cursor()<cr>", desc="Run to Cursor" },
      { "<leader>do", ":lua require'dap'.step_over()<cr>", desc="Step Over" },
      { "<leader>dt", ":lua require'dap'.step_out()<cr>", desc="Step Out" },
      { "<leader>dv", ":lua require'dapui'.toggle()<cr>", desc="View" },
      { "<leader>dn", ":lua require'osv'.launch({port = 8086})<cr>", desc="Start nvim debug server" },
    },
    config = function ()
      local dap = require('dap')
      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = {
            vim.fn.stdpath('data') .. '/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js',
            "${port}",
          },
        }
      }
      dap.configurations.typescript = {
        {
          trace = true,
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
        {
          type = "pwa-node",
          request = "attach",
          name = "Docker: Attach to High Priority Worker",
          protocol = "inspector",
          console = 'integratedTerminal',
          port = 9231,
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
          request = "launch",
          name = "Local Script Runner",
          protocol = "inspector",
          console = 'integratedTerminal',

          runtimeExecutable = "node",
          runtimeArgs = {"--nolazy", "-r", "ts-node/register/transpile-only"},
          args = {"scripts/rankingSnapshotMigration/bigQuery.ts", "production"},
          cwd = "${workspaceFolder}/server",


          restart = true,
          sourceMaps = true,
          timeout = 5000,
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
          request = "launch",
          name = "Docker Script Runner",
          protocol = "inspector",
          console = 'integratedTerminal',

          runtimeExecutable = "docker-compose",
          runtimeArgs = {"exec", "lh-server", "node", "--inspect=0.0.0.0:9228", "--nolazy", "-r", "ts-node/register/transpile-only"},
          args = {"scripts/migrateSnapshotsToMongo.ts", "production"},
          cwd = "${workspaceFolder}",

          attachSimplePort = 9228,
          address = "localhost",
          localRoot = "${workspaceFolder}",
          remoteRoot = "/app",
          restart = true,
          sourceMaps = true,
          timeout = 5000,
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
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
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
    'microsoft/vscode-js-debug',
    lazy = true,
  },
  {
    'jbyuki/one-small-step-for-vimkind',
    config = function ()
      local dap = require"dap"
      dap.configurations.lua = {
        {
          type = 'nlua',
          request = 'attach',
          name = "Attach to running Neovim instance",
        }
      }

      dap.adapters.nlua = function(callback, config)
        callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
      end
    end,
  },
}
