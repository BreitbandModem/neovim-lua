local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')
local telescope_state = require('telescope.state')
local telescope_previewers = require("telescope.previewers")

telescope.setup({
	defaults = {
		file_previewer = telescope_previewers.vim_buffer_cat.new,
		grep_previewer = telescope_previewers.vim_buffer_vimgrep.new,
		qflist_previewer = telescope_previewers.vim_buffer_qflist.new,
  },
  pickers = {
    find_files = {
      hidden = true
    },
  }
})

telescope.load_extension("live_grep_args")
telescope.load_extension("yank_history")
telescope.load_extension("ui-select")

local M = {}

-- remember last search
local last_search = nil

M.search_with_cache = function()
  if last_search == nil then
    telescope.extensions.live_grep_args.live_grep_args()

    local cached_pickers = telescope_state.get_global_key "cached_pickers" or {}
    last_search = cached_pickers[1]
  else
    telescope_builtin.resume({ picker = last_search })
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
