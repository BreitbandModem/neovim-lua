-- picker for dotfiles (nvim configs)
return {
  'mrjones2014/legendary.nvim',
  opts = {
    keymaps = {
      { '<leader>ll', ':Legendary<CR>', description = 'Legendary' },
    },
    commands = {
      {
        ':GrepWithCache',
        function()
          local telescope = require('telescope')
          local telescope_builtin = require('telescope.builtin')
          local telescope_state = require('telescope.state')
          local last_grep_cache_index = nil

          local cached_pickers = telescope_state.get_global_key "cached_pickers" or {}
          for index,picker in ipairs(cached_pickers) do
            if string.find(picker.prompt_title, 'Grep') then
              picker.initial_mode = 'normal'
              last_grep_cache_index = index
            end
          end

          if last_grep_cache_index == nil then
            telescope.extensions.live_grep_args.live_grep_args()
          else
            telescope_builtin.resume({ cache_index = last_grep_cache_index })
          end
        end,
        description = 'Grep files through telescope with previous state cached',
      },
    },
    {
      ':SearchDotFiles',
      function ()
        local telescope_builtin = require('telescope.builtin')
        telescope_builtin.find_files({
          prompt_title = "< VimRC >",
          cwd = "~/.config/nvim",
          hidden = true,
        })
      end,
      description = 'Search NVIM dotfiles through telescope',
    },
    which_key = { auto_register = true },
  },
}
