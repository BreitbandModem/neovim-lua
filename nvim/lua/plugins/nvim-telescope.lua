local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')
local telescope_state = require('telescope.state')
local telescope_previewers = require("telescope.previewers")

telescope.setup({
	defaults = {
		file_previewer = telescope_previewers.vim_buffer_cat.new,
		grep_previewer = telescope_previewers.vim_buffer_vimgrep.new,
		qflist_previewer = telescope_previewers.vim_buffer_qflist.new,
    cache_picker = { num_pickers = 5 },
  },
  pickers = {
    find_files = {
      hidden = true
    },
  },
  extensions = {
    frecency = {
      show_scores = true,
      show_unindexed = true,
      ignore_patterns = {"*.git/*", "*/tmp/*"},
      disable_devicons = false,
      default_workspace = "CWD",
      workspaces = {
        ["server"]    = "./server",
        ["client"]    = "./client",
        ["migrations"] = "./db/knex/migrations",
      },
      show_filter_column = true,
    }
  },
})

telescope.load_extension("live_grep_args")
telescope.load_extension("yank_history")
telescope.load_extension("ui-select")
telescope.load_extension("frecency")

local M = {}

M.grep_with_cache = function()
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
end

-- picker for dotfiles (nvim configs)

M.search_dotfiles = function()
  telescope_builtin.find_files({
    prompt_title = "< VimRC >",
    cwd = "~/.config/nvim",
    hidden = true,
  })
end

return M
