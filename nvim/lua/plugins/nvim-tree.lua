return {
  'kyazdani42/nvim-tree.lua',
  config = {
    respect_buf_cwd = true,
    sync_root_with_cwd = true,
    filters = {
      dotfiles = true,
      custom = { '.git', 'node_modules', '.cache', '.bin' },
    },
  },
}
