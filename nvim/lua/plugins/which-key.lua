return {
  "folke/which-key.nvim",
  dependencies = { 'mrjones2014/legendary.nvim' },
  opts = {},
  keys = {
    {"+", ":vertical resize +5<CR>", desc="Vertical Grow"},
    {"-", ":vertical resize -5<CR>", desc="Vertical Shrink"},
    {"<leader>c", ":nohl<CR>", desc="Clear Highlighting"},
    { "<leader>q", ":q<CR>", desc="Quit"},
    { "<leader>s", ":w<CR>", desc="Save"},
    { "<leader>Q", ":qa<CR>", desc="Quit and Exit"},
  },
  config = function ()
    vim.keymap.set("n", "p", "<Plug>(YankyPutAfter)", {})
    vim.keymap.set("n", "P", "<Plug>(YankyPutBefore)", {})
    vim.keymap.set("x", "p", "<Plug>(YankyPutAfter)", {})
    vim.keymap.set("x", "P", "<Plug>(YankyPutBefore)", {})
    vim.keymap.set("n", "gp", "<Plug>(YankyGPutAfter)", {})
    vim.keymap.set("n", "gP", "<Plug>(YankyGPutBefore)", {})
    vim.keymap.set("x", "gp", "<Plug>(YankyGPutAfter)", {})
    vim.keymap.set("x", "gP", "<Plug>(YankyGPutBefore)", {})

    vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleForward)", {})
    vim.keymap.set("n", "<c-y>", "<Plug>(YankyCycleBackward)", {})

    -- this needs to be mapped in order for the preserve_cursor_position feature to work
    -- last time I tried, this throws some error message unfortunately...
    vim.keymap.set("n", "y", "<Plug>(YankyYank)", {})
    vim.keymap.set("x", "y", "<Plug>(YankyYank)", {})
  end
}
