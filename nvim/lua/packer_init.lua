-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README
--- neovim-lua/README.md
--- https://github.com/brainfucksec/neovim-lua#readme


local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require 'packer'

-- Add packages
return packer.startup(function()
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- File explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Tag viewer
  use 'liuchengxu/vista.vim'

  -- Indent line
  use 'lukas-reineke/indent-blankline.nvim'

  -- Color schemes
  use 'navarasu/onedark.nvim'

  use 'tanvirtin/monokai.nvim'

  use { 'rose-pine/neovim', as = 'rose-pine' }

  -- Statusline
  use {
    'famiu/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- git labels
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Dashboard (start screen)
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- Telescope fuzzy file finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    }
  }

  -- Use telescope for vim ui.select
  use { 'nvim-telescope/telescope-ui-select.nvim' }

  -- numToStr/Comment.nvim to comment code
  use 'numToStr/Comment.nvim'

  -- ellisonleao/glow.nvim for markdown preview
  use 'ellisonleao/glow.nvim'

  -- vim-test/vim-test unit test integration
  use 'vim-test/vim-test'

  -- folke/zen-mode.nvim to maximize the current buffer
  use 'folke/zen-mode.nvim'

  -- 'folke/which-key.nvim to show key bindings for commands
  use 'folke/which-key.nvim'

  -- use coc for code completion
  -- use {'neoclide/coc.nvim', branch = 'release'}

  -- dap debugger
  use { 'mfussenegger/nvim-dap' }
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

  -- yank history
  use({ 'gbprod/yanky.nvim' })

  -- session manager
  use 'Shatur/neovim-session-manager'

  -- use nvim LSP
  use 'neovim/nvim-lspconfig'

  -- LSP autocompletion
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp

  -- snippet support
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  -- Treesitter language parser
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-context'
end)
