return {
    -- the colorscheme should be available when starting Neovim
    {
      'rebelot/kanagawa.nvim',
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
        -- load the colorscheme here
        vim.cmd([[colorscheme kanagawa]])
      end,
    },

    'kyazdani42/nvim-web-devicons',

    {
      'lewis6991/gitsigns.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('gitsigns').setup()
        require('scrollbar.handlers.gitsigns').setup()
      end
    },

    {
      'folke/zen-mode.nvim', -- focus current window
      opts = {
        window = {
          width = 150
        }
      },
    },

    'ThePrimeagen/harpoon', -- quickly set and access bookmarks

    {
      'petertriho/nvim-scrollbar',
      config = true,
    },
    {
      'kevinhwang91/nvim-hlslens',
      config = function()
        -- require('hlslens').setup() is not required
        require('scrollbar.handlers.search').setup()
      end,
    },

    {
      'liangxianzhe/floating-input.nvim',
      config = true,
    },

    'voldikss/vim-floaterm',
    -- I'm using floaterm with lazygit with the following conf:
    --[[
      os:
        editCommand: 'floaterm'
      keybinding:
        universal:
          return: 'q'
      gui:
        theme:
          selectedLineBgColor:
            - underline
          selectedRangeBgColor:
            - underline
      git:
        paging:
          colorArg: never
          pager: delta --dark --paging=never
    ]]

    'HiPhish/rainbow-delimiters.nvim',

    -- { "chrisgrieser/nvim-spider", lazy = true },

    {
      "ellisonleao/glow.nvim",
      opts = {
        style = "dark",
        width_ratio = 0.9,
        height_ratio = 0.9,
      },
      cmd = "Glow",
    },

    {
      'github/copilot.vim',
      init = function()
        vim.keymap.set('i', '<C-.>', '<Plug>(copilot-next)')
        vim.keymap.set('i', '<C-,>', '<Plug>(copilot-previous)')
        vim.keymap.set('i', '<C-g>', '<Plug>(copilot-suggest)')
      end,
    },

    {
      'rcarriga/nvim-notify',
      init = function ()
        vim.notify = require("notify")
      end
    },

    {
      'dmmulroy/tsc.nvim',
      config = true,
    },

    'sindrets/diffview.nvim',

    {
      "folke/edgy.nvim",
      event = "VeryLazy",
      opts = {
        -- Refer to my configuration here https://github.com/jellydn/lazy-nvim-ide/blob/main/lua/plugins/extras/edgy.lua
        right = {
          {
            title = "CopilotChat.nvim", -- Title of the window
            ft = "copilot-chat", -- This is custom file type from CopilotChat.nvim
            size = { width = 0.4 }, -- Width of the window
          },
        },
        bottom = {
          {
            title = "DB",
            ft = "dbout",
            size = { height = 0.4 },
          },
        },
      },
    },

    { 'dmmulroy/ts-error-translator.nvim' },

    {
      "folke/trouble.nvim",
      keys = {
        {
          "<leader>xx",
          -- "<cmd>Trouble diagnostics toggle<cr>",
          "<cmd>Trouble mydiags toggle<cr>",
          desc = "Diagnostics (Trouble)",
        },
        {
          "<leader>xX",
          "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
          desc = "Buffer Diagnostics (Trouble)",
        },
        {
          "<leader>cs",
          "<cmd>Trouble symbols toggle focus=false<cr>",
          desc = "Symbols (Trouble)",
        },
        {
          "<leader>cl",
          "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
          desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
          "<leader>xL",
          "<cmd>Trouble loclist toggle<cr>",
          desc = "Location List (Trouble)",
        },
        {
          "<leader>xQ",
          "<cmd>Trouble qflist toggle<cr>",
          desc = "Quickfix List (Trouble)",
        },
      },
      opts = {
        modes = {
          mydiags = {
            mode = "diagnostics", -- inherit from diagnostics mode
            filter = {
              any = {
                buf = 0, -- current buffer
                {
                  severity = vim.diagnostic.severity.ERROR, -- errors only
                  -- limit to files in the current project
                  function(item)
                    return item.filename:find(vim.loop.cwd(), 1, true)
                  end,
                },
              },
            },
          }
        }
      }, -- for default options, refer to the configuration section for custom setup.
    }
  }
