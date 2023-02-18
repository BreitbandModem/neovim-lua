return {
  'shortcuts/no-neck-pain.nvim', -- center buffers
  version = '*',
  config = {
    enableOnVimEnter = true,
    buffers = {
      right = {
        enabled = false,
      },
    },
  }
}
