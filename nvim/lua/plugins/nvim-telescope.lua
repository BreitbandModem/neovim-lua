require("telescope").setup({
	defaults = {
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
  },
  pickers = {
    find_files = {
      hidden = true
    },
  }
})

require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("yank_history")
require("telescope").load_extension("ui-select")

local M = {}

M.search_dotfiles = function()
  require("telescope.builtin").find_files({
    prompt_title = "< VimRC >",
    cwd = "/Users/matze/.config/nvim",
    hidden = true,
  })
end

return M
