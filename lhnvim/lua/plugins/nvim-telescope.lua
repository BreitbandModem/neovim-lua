return {
  'nvim-telescope/telescope-ui-select.nvim',
  'gbrlsnchs/telescope-lsp-handlers.nvim',
  {
    'danielfalk/smart-open.nvim',
    branch = '0.1.x',
    config = function()
      require'telescope'.load_extension('smart_open')
    end,
    dependencies = {'kkharji/sqlite.lua'}
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-live-grep-args.nvim' },
      { "nvim-orgmode/telescope-orgmode.nvim" },
    },
    keys = {
      { "<leader>ff", "<Cmd>lua require('telescope').extensions.smart_open.smart_open()<CR>", desc="Smart Open" },
      { "<leader>fg", ":GrepWithCache<CR>", desc="Grep Files" },
      { "<leader>fb", ":Telescope buffers<CR>", desc="Buffers" },
      { "<leader>fh", ":Telescope help_tags<CR>", desc="Help" },
      { "<leader>fd", ":SearchDotFiles<CR>", desc="Dot Files" },
      { "<leader>fr", ":Telescope oldfiles<CR>", desc="Recent Files" },
      { "<leader>fs", ":Telescope git_status<CR>", desc="Git Status" },
      { "<leader>fy", ":Telescope yank_history<CR>", desc="Yanks" },
      { "<leader>oR", ":lua require('telescope').extensions.orgmode.refile_heading({ mode = 'orgfiles' })<CR>", desc="Orgmode Refile" },
      { "<leader>oif", ":Telescope orgmode insert_link<CR>", desc="Link Orgfile" },
      { "<leader>of", ":Telescope orgmode search_headings<CR>", desc="Find Orgfile" },
    },
    config = function ()
      local telescope_previewers = require("telescope.previewers")
      local telescope = require('telescope')
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
          lsp_handlers = {
            code_action = {
              telescope = require('telescope.themes').get_dropdown({}),
            },
          },
        },
      })

      telescope.load_extension("live_grep_args")
      telescope.load_extension("yank_history")
      telescope.load_extension("ui-select")
      telescope.load_extension("lsp_handlers")
      telescope.load_extension("orgmode")
    end
  },
}
