local utils = require("yanky.utils")
local mapping = require("yanky.telescope.mapping")
require('yanky').setup({
  {
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
  }
})

vim.keymap.set("n", "p", "<Plug>(YankyPutAfter)", {})
vim.keymap.set("n", "P", "<Plug>(YankyPutBefore)", {})
vim.keymap.set("n", "gp", "<Plug>(YankyGPutAfter)", {})
vim.keymap.set("n", "gP", "<Plug>(YankyGPutBefore)", {})
vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleForward)", {})
vim.keymap.set("n", "<c-y>", "<Plug>(YankyCycleBackward)", {})

vim.keymap.set("x", "p", "<Plug>(YankyPutAfter)", {})
vim.keymap.set("x", "P", "<Plug>(YankyPutBefore)", {})
vim.keymap.set("x", "gp", "<Plug>(YankyGPutAfter)", {})
vim.keymap.set("x", "gP", "<Plug>(YankyGPutBefore)", {})

-- this needs to be mapped in order for the preserve_cursor_position feature to work
-- last time I tried, this throws some error message unfortunately...
-- vim.keymap.set("n", "y", "<Plug>(YankyYank)", {})
-- vim.keymap.set("x", "y", "<Plug>(YankyYank)", {})
