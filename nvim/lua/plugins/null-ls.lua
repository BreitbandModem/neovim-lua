local null_ls = require("null-ls")
local eslint_config = {
  timeout = 30000,
  cwd = function(params)
    return params.root:match("lh-develop") and "lh-develop"
  end,
}
null_ls.setup({
  -- debug = true,
  sources = {
    -- eslint takes around 20 seconds to lint a file!
    -- null_ls.builtins.diagnostics.eslint.with(eslint_config),
    null_ls.builtins.formatting.eslint.with(eslint_config),
    -- null_ls.builtins.code_actions.eslint.with(eslint_config),
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.completion.luasnip,
  },
})
