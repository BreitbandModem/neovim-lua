return {
  'lukas-reineke/indent-blankline.nvim',
  config = {
    enabled = true,
    show_current_context = true,
    use_treesitter = true,
    show_current_context_start = true,
    show_end_of_line = true,
    char = "▏",
    -- context_char = '┃',
    space_char_blankline = " ",
    filetype_exclude = {
      'help',
      'git',
      'markdown',
      'text',
      'terminal',
      'lspinfo',
      'packer',
    },
    buftype_exclude = {
      'terminal',
      'nofile',
    },
  }
}
