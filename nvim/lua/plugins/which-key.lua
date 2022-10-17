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
  a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
  e = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Code Action" },
  c = {":nohl<CR>", "Clear Highlighting"},
  d = {
    name = "Debug",
    b = {":lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint"},
    c = {":lua require'dap'.continue()<cr>", "Attach/Continue"},
    d = {":lua require'dap'.disconnect()<cr>", "Detach"},
    e = {":lua require'dapui'.eval()<cr>", "Eval"},
    i = {":lua require'dap'.step_into()<cr>", "Step Into"},
    l = {":lua require'dap'.run_to_cursor()<cr>", "Run to Cursor"},
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
    f = {":Telescope frecency<CR>", "Frecent Files" },
    g = {":lua require('plugins/nvim-telescope').grep_with_cache()<CR>", "Grep Files" },
    b = {":Telescope buffers<CR>", "Buffers" },
    h = {":Telescope help_tags<CR>", "Help" },
    d = {
      ":lua require('plugins/nvim-telescope').search_dotfiles()<CR>",
      "Dot Files",
    },
    r = {":Telescope oldfiles<CR>", "Recent Files" },
    s = {":Telescope git_status<CR>", "Git Status" },
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
    f = { "<cmd>lua vim.lsp.buf.format({async=true})<CR>", "Format Code" },
    n = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Format Code" },
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
  d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
  D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
  r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
  i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
}

local normal_opts = {
  mode = "n",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local normal_mappings = {
  K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Symbol Info" },
  ["<c-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Info" },
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
  g = {
    name = "Git",
    s = { ":Gitsigns stage_hunk<CR>", "Stage Hunk" },
  },
}

wk.register(normal_leader_mappings, normal_leader_opts)
wk.register(visual_leader_mappings, visual_leader_opts)
wk.register(normal_g_mappings, normal_g_opts)
wk.register(normal_mappings, normal_opts)
