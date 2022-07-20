local wk = require("which-key")

local normal_leader_opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

vim.keymap.set("n", "p", "<Plug>(YankyPutAfter)", {})
vim.keymap.set("n", "P", "<Plug>(YankyPutBefore)", {})
vim.keymap.set("x", "p", "<Plug>(YankyPutAfter)", {})
vim.keymap.set("x", "P", "<Plug>(YankyPutBefore)", {})
vim.keymap.set("n", "gp", "<Plug>(YankyGPutAfter)", {})
vim.keymap.set("n", "gP", "<Plug>(YankyGPutBefore)", {})
vim.keymap.set("x", "gp", "<Plug>(YankyGPutAfter)", {})
vim.keymap.set("x", "gP", "<Plug>(YankyGPutBefore)", {})

local normal_leader_mappings = {
  ["+"] = {":vertical resize +5<CR>", "Vertical Grow"},
  ["-"] = {":vertical resize -5<CR>", "Vertical Shrink"},
  ["/"] = { ":lua require('Comment.api').toggle_current_linewise()<CR>", "Comment Line" },
  a = {"<Plug>(coc-codeaction-selected)<cr>", "Code Action"},
  c = {":nohl<CR>", "Clear Highlighting"},
  d = {
    name = "Debug",
    b = {":lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint"},
    c = {":lua require'dap'.continue()<cr>", "Attach/Continue"},
    d = {":lua require'dap'.disconnect()<cr>", "Detach"},
    e = {":lua require'dapui'.eval()<cr>", "Eval"},
    i = {":lua require'dap'.step_into()<cr>", "Step Into"},
    o = {":lua require'dap'.step_over()<cr>", "Step Over"},
    t = {":lua require'dap'.step_out()<cr>", "Step Out"},
    v = {":lua require'dapui'.toggle()<cr>", "View"},
  },
  q = {":q<CR>", "Quit"},
  Q = {":qa<CR>", "Quit and Exit"},
  s = {":w<CR>", "Save"},
  z = {":ZenMode<CR>", "Zen Mode" },
  n = { ":NvimTreeFindFile<CR>", "Locate File" },
  f = {
    name = "Telescope",
    f = {":Telescope find_files<CR>", "Find Files" },
    g = {":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", "Grep Files" },
    b = {":Telescope buffers<CR>", "Buffers" },
    h = {":Telescope help_tags<CR>", "Help" },
    d = {
      ":lua require('plugins/nvim-telescope').search_dotfiles()<CR>",
      "Dot Files",
    },
    y = {":Telescope yank_history<CR>", "Yanks" },
  },
  g = {
    name = "Git",
    p = {":Gitsigns preview_hunk<CR>", "Preview Hunk"},
    s = {":Gitsigns stage_hunk<CR>", "Stage Hunk" },
    S = {":Gitsigns stage_buffer<CR>", "Stage File"},
    u = {":Gitsigns undo_stage_hunk<CR>", "Un-Stage Hunk"},
    r = {":Gitsigns reset_hunk<CR>", "Reset Hunk"},
    R = {":Gitsigns reset_buffer<CR>", "Reset File"},
    b = {":Gitsigns blame_line<CR>", "Blame Line"},
    n = {":Gitsigns next_hunk<CR>", "Next Hunk"},
    N = {":Gitsigns prev_hunk<CR>", "Previous Hunk"},
    d = {":Gitsigns diffthis<CR>", "Diff"},
  },
  r = {
    name = "Rename/Format",
    f = { "<Plug>(coc-format-selected)<cr>", "Format Code" },
    n = { "<Plug>(coc-rename)", "Rename Symbol" },
  },
  t = {
    name = "Test",
--  f = { ":TestFile<cr>", "File" },
    l = { ":TestLast<cr>", "Last" },
    n = { ":TestNearest<cr>", "Nearest" },
    s = { ":TestSuite<cr>", "Suite" },
    v = { ":TestVisit<cr>", "Visit" },
    d = {
      name = "Debug Tests",
      l = { ":TestLast --inspect=0.0.0.0:9228 | lua require'dap'.run(vim.g.dap_test_configuration)<cr>", "Last" },
      n = { ":TestNearest --inspect=0.0.0.0:9228 | lua require'dap'.run(vim.g.dap_test_configuration)<cr>", "Nearest" },
      s = { ":TestSuite --inspect=0.0.0.0:9228 | lua require'dap'.run(vim.g.dap_test_configuration)<cr>", "Suite" },
      v = { ":TestVisit --inspect=0.0.0.0:9228 | lua require'dap'.run(vim.g.dap_test_configuration)<cr>", "Visit" },
    },
  },
  v = { ":Vista!!<cr>", "Vista" },
}

local normal_g_opts = {
  mode = "n",
  prefix = "g",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local normal_g_mappings = {
  d = { "<Plug>(coc-definition)", "Definition" },
  y = { "<Plug>(coc-type-definition)", " Type Definition" },
  i = { "<Plug>(coc-implementation)", "Implementation" },
  r = { "<Plug>(coc-references)", "References" },
}


local visual_leader_opts = {
  mode = "v", -- Visual mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local visual_leader_mappings = {
  a = {"<Plug>(coc-codeaction-selected)<cr>", "Code Action"},
  g = {
    name = "Git",
    s = { ":Gitsigns stage_hunk<CR>", "Stage Hunk" },
  },
  r = {
    f = { "<Plug>(coc-format-selected)<cr>", "Format Code" },
  }
}

wk.register(normal_leader_mappings, normal_leader_opts)
wk.register(visual_leader_mappings, visual_leader_opts)
wk.register(normal_g_mappings, normal_g_opts)