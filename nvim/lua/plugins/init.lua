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
      'numToStr/Comment.nvim',
      config = true,
    },

    'ellisonleao/glow.nvim', -- markdown preview

    'folke/zen-mode.nvim', -- focus current window


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

    -- requires vim 0.9
    --[[ {
      'liangxianzhe/floating-input.nvim',
      config = true,
    } ]]

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

    {
      'HiPhish/nvim-ts-rainbow2',
      dependencies = { 'nvim-treesitter/nvim-treesitter' },
    },
  }
