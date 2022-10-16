--[[

Neovim init file
Version: 0.50.1 - 2022/03/15
Maintainer: brainf+ck
Website: https://github.com/brainfucksec/neovim-lua

--]]

-- import general vim settings
require('core/settings')
require('core/keymaps')
require('core/colors')

-- If not in vscode, import Lua modules
if vim.g.vscode == nil then
  require('packer_init')
  require('plugins/nvim-lsp')
  require('plugins/nvim-cmp')
  require('plugins/nvim-tree')
  require('plugins/yanky')
  require('plugins/nvim-telescope')
  require('plugins/comment')
  require('plugins/indent-blankline')
  require('plugins/feline')
  require('plugins/alpha-nvim')
  require('plugins/glow')
  require('plugins/vim-test')
  require('plugins/which-key')
  require('plugins/dap')
  require('plugins/neovim-session-manager')
  require('plugins/nvim-treesitter')
  require('plugins/nvim-autopairs')
end
