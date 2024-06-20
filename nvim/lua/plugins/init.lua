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

  }
