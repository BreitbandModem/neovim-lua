-- yank history
return {
  'gbprod/yanky.nvim',
  opts = {
    ring = {
      history_length = 10,
      storage = "shada",
      sync_with_numbered_registers = true,
    },
    picker = {
      select = {
        action = nil, -- nil to use default put action
      },
      telescope = {
        mappings = nil, -- nil to use default put action
      },
    },
    system_clipboard = {
      sync_with_ring = true,
    },
    highlight = {
      on_put = false,
      on_yank = false,
      timer = 500,
    },
    preserve_cursor_position = {
      enabled = true,
    },
    textobj = {
      enabled = false,
    },
  },
}
