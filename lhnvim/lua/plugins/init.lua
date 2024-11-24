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
    lazy = false,
    keys = {
      -- { "<leader>gg", ":FloatermNew lazygit<CR>", desc="LazyGit" },
      { "<leader>gp", ":Gitsigns preview_hunk<CR>", desc="Preview Hunk" },
      { "<leader>gs", ":Gitsigns stage_hunk<CR>", desc="Stage Hunk" },
      { "<leader>gS", ":Gitsigns stage_buffer<CR>", "Stage File"},
      { "<leader>gu", ":Gitsigns undo_stage_hunk<CR>", desc="Un-Stage Hunk" },
      { "<leader>gr", ":Gitsigns reset_hunk<CR>", desc="Reset Hunk" },
      { "<leader>gR", ":Gitsigns reset_buffer<CR>", desc="Reset File" },
      -- { "<leader>gb", ":Gitsigns blame_line<CR>", desc="Blame Line" },
      { "<leader>gn", ":Gitsigns next_hunk<CR>", desc="Next Hunk" },
      { "<leader>gN", ":Gitsigns prev_hunk<CR>", desc="Previous Hunk" },
      { "<leader>gd", ":Gitsigns diffthis<CR>", desc="Diff" },
      { "<leader>gs", ":Gitsigns stage_hunk<CR>", desc="Stage Hunk", mode = "v" },
    },
    config = function()
      require('gitsigns').setup()
      require('scrollbar.handlers.gitsigns').setup()
    end
  },

  {
    'folke/zen-mode.nvim', -- focus current window
    keys = {
      { "<leader>z", ":ZenMode<CR>", desc="Zen Mode" },
    },
    opts = {
      window = {
        width = 150
      }
    },
  },

  {
    'ThePrimeagen/harpoon', -- quickly set and access bookmarks
    keys = {
      { "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", desc="Add file to Harpoon" },
      { "<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", desc="Harpoon UI" },
      { "<leader>hn", ":lua require('harpoon.ui').nav_next()<CR>", desc="Next file" },
      { "<leader>hp", ":lua require('harpoon.ui').nav_prev()<CR>", desc="Previous file" },
      {"<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>", desc="Harpoon file 1" },
      {"<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>", desc="Harpoon file 2" },
      {"<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>", desc="Harpoon file 3" },
      {"<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>", desc="Harpoon file 4" },
    },
  },

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

  {
    'voldikss/vim-floaterm',
    lazy = false,
    keys = {
      { "<leader>T",  ":FloatermToggle<CR>", desc="Terminal" },
    },
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
  },

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
      -- vim.notify = require("notify")
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
      top = {
        {
          title = "Orgmode Agenda",
          ft = "orgagenda",
          size = { height = 0.4 },
        }
      },
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
  },

  {
    "FabijanZulj/blame.nvim",
    config = true,
    keys = {
      { "<leader>gb", ":BlameToggle window<cr>", desc="Git Blame" },
    }
  },

  { 'glacambre/firenvim', build = ":call firenvim#install(0)" },

  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
      require('orgmode').setup({
        org_agenda_files = '~/gdrive/orgfiles/**/*',
        org_default_notes_file = '~/gdrive/orgfiles/refile.org',
        org_blank_before_new_entry = { heading = false, plain_list_item = false },
        mappings = {
          org = {
            org_refile = false,
          },
          capture = {
            org_capture_refile = false,
          },
          agenda = {
            org_agenda_refile = '<leader>oR',
          },
        },
      })
    end,
  },
  {
    "chipsenkbeil/org-roam.nvim",
    dependencies = {
      {
        "nvim-orgmode/orgmode",
      },
    },
    config = function()
      require("org-roam").setup({
        directory = "~/gdrive/orgfiles/roam",
        bindings = {
          prefix = "<LocalLeader>or",
        },
      })
    end,
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true,
    keys = {
      { "<leader>gg", ":Neogit<CR>", desc="Neogit" },
    },
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      keywords = {
        MB = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      },
    },
  },
}
