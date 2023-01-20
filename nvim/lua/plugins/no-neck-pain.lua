-----------------------------------------------------------
-- NoNeckPain configuration file
-----------------------------------------------------------

-- Plugin: shortcuts/no-neck-pain.nvim
-- url: https://github.com/shortcuts/no-neck-pain.nvim

require('no-neck-pain').setup ({
  enableOnVimEnter = true,
  buffers = {
    right = {
      enabled = false,
    },
  },
})

