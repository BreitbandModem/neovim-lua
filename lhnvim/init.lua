-- install lazy.nvim which is our package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- import general vim settings
require('core/settings')
require('core/keymaps')

-- If not in vscode, load plugins through lazy.nvim
if vim.g.vscode == nil then
  require('lazy').setup('plugins')
  require('plugins/nvim-lsp')
end
