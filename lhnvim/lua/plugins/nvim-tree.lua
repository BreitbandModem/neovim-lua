return {
  'kyazdani42/nvim-tree.lua',
  keys = {
    { "<leader>n",  ":NvimTreeFindFile<CR>", desc="Locate File" },
  },
  lazy = false,
  opts = {
    respect_buf_cwd = true,
    sync_root_with_cwd = true,
    filters = {
      dotfiles = true,
      custom = { 'node_modules', '.cache', '.bin' },
    },
  },
}
