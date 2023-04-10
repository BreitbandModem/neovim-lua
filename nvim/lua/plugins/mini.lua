-- Autocompletion plugins
return {
  'echasnovski/mini.nvim', version = '*',
  config = function ()
    require('')
    require('mini.completion').setup({
      "lsp_completion = {source_func = 'omnifunc', auto_setup = false}",
    })
    -- Autocompletion keymaps (mini.complete)
    -- To use `<Tab>` and `<S-Tab>` for navigation through completion list
    vim.api.nvim_set_keymap('i', '<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]],   { noremap = true, expr = true })
    vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })
    -- To get more consistent behavior of `<CR>`
    local keys = {
      ['cr']        = vim.api.nvim_replace_termcodes('<CR>', true, true, true),
      ['ctrl-y']    = vim.api.nvim_replace_termcodes('<C-y>', true, true, true),
      ['ctrl-y_cr'] = vim.api.nvim_replace_termcodes('<C-y><CR>', true, true, true),
    }
    _G.cr_action = function()
      if vim.fn.pumvisible() ~= 0 then
        -- If popup is visible, confirm selected item or add new line otherwise
        local item_selected = vim.fn.complete_info()['selected'] ~= -1
        return item_selected and keys['ctrl-y'] or keys['ctrl-y_cr']
      else
        -- If popup is not visible, use plain `<CR>`. You might want to customize
        -- according to other plugins. For example, to use 'mini.pairs', replace
        -- next line with `return require('mini.pairs').cr()`
        return keys['cr']
      end
    end
    vim.api.nvim_set_keymap('i', '<CR>', 'v:lua._G.cr_action()', { noremap = true, expr = true })
  end,
}
