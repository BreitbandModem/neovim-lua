local wk = require("which-key")

local normal_opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local normal_mappings = {
  ["+"] = {":vertical resize +5<CR>", "Vertical Grow"},
  ["-"] = {":vertical resize -5<CR>", "Vertical Shrink"},
  ["/"] = { ":lua require('Comment.api').toggle_current_linewise()<CR>", "Comment Line" },
  c = {":nohl<CR>", "Clear Highlighting"},
  q = {":q<CR>", "Quit"},
  Q = {":qa<CR>", "Quit and Exit"},
  s = {":w<CR>", "Save"},
  z = {":ZenMode<CR>", "Zen Mode" },
  n = { ":NvimTreeFindFile<CR>", "Locate File" },
  f = {
    name = "Telescope",
    f = {":Telescope find_files<CR>", "Find Files" },
    g = {":Telescope live_grep<CR>", "Grep Files" },
    b = {":Telescope buffers<CR>", "Buffers" },
    h = {":Telescope help_tags<CR>", "Help" },
    d = {
      ":lua require('plugins/nvim-telescope').search_dotfiles()<CR>",
      "Dot Files",
    },
  },
  g = {
    name = "Git",
    p = {":Gitsigns preview_hunk<CR>", "Preview Hunk"},
    s = {":Gitsigns stage_hunk<CR>", "Stage Hunk" },
    S = {":Gitsigns stage_buffer<CR>", "Stage File"},
    u = {":Gitsigns undo_stage_hunk<CR>", "Un-Stage Hunk"},
    r = {":Gitsigns reset_hunk()<CR>", "Reset Hunk"},
    R = {":Gitsigns reset_buffer()<CR>", "Reset File"},
    b = {":Gitsigns blame_line<CR>", "Blame Line"},
    n = {":Gitsigns next_hunk<CR>", "Next Hunk"},
    N = {":Gitsigns prev_hunk<CR>", "Previous Hunk"},
    d = {":Gitsigns diffthis<CR>", "Diff"},
  },
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = {
      "<cmd>Telescope lsp_document_diagnostics<cr>",
      "Document Diagnostics",
    },
    w = {
      "<cmd>Telescope lsp_workspace_diagnostics<cr>",
      "Workspace Diagnostics",
    },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    j = {
      "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
  },
}

local visual_opts = {
  mode = "v", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local visual_mappings = {
  g = {
    name = "Git",
    s = { ":Gitsigns stage_hunk<CR>", "Stage Hunk" },
  },
}

wk.register(normal_mappings, normal_opts)
wk.register(visual_mappings, visual_opts)
