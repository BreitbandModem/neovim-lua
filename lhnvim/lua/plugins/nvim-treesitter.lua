return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = {
        "vimdoc", "typescript", "javascript", "gitignore", "regex", "css", "json", "vim", "lua", "markdown_inline", "http", "vue", "yaml",
      },
      auto_install = true,
      highlight = { enable = true },
      incremental_selection = { enable = true },
      textobjects = { enable = true },
    },
  },
  'nvim-treesitter/nvim-treesitter-context',
}
