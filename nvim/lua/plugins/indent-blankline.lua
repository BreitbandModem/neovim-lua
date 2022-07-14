-----------------------------------------------------------
-- Indent line configuration file
-----------------------------------------------------------

-- Plugin: indent-blankline
-- url: https://github.com/lukas-reineke/indent-blankline.nvim


require('indent_blankline').setup {
  enabled = true,
  use_treesitter = false,
  char = "▏",
  -- context_char = '┃',
  space_char_blankline = " ",
  show_first_indent_level = false,
  show_current_context = false,
  show_current_context_start = false,
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
