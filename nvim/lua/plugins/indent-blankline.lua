return {
  'lukas-reineke/indent-blankline.nvim',
  dependencies = { 'HiPhish/rainbow-delimiters.nvim' },
  main = "ibl",
  -- opts = {},
  init = function ()
    local highlight = {
     "RainbowDelimiterCyan",
     "RainbowDelimiterViolet",
     "RainbowDelimiterBlue",
     "RainbowDelimiterGreen",
     "RainbowDelimiterYellow",
     "RainbowDelimiterOrange",
     "RainbowDelimiterRed",
    }
    vim.g.rainbow_delimiters = { highlight = highlight }

   require "ibl".setup { scope = { highlight = highlight } }
    local hooks = require "ibl.hooks"
    hooks.register(
      hooks.type.SCOPE_HIGHLIGHT,
      hooks.builtin.scope_highlight_from_extmark
    )
  end
}
