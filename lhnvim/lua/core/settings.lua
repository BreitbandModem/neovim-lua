-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
--- See: https://neovim.io/doc/user/vim_diff.html
--- [2] Defaults - *nvim-defaults*

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
local cmd = vim.cmd     				      -- Execute Vim commands
local exec = vim.api.nvim_exec 	      -- Execute Vimscript
local autocmd = vim.api.nvim_create_autocmd  -- Nvim autocommand api
local g = vim.g         				      -- Global variables
local opt = vim.opt         		      -- Set options (global/buffer/windows-scoped)
--local fn = vim.fn       				    -- Call Vim functions

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = ''                        -- Disable mouse support
opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
opt.swapfile = false                  -- Don't use swapfile
opt.completeopt = {'menu', 'menuone', 'noselect'}  -- Autocomplete options
opt.timeoutlen = 400                  -- Timeout before which-key is activated
opt.scrolloff = 8                     -- min number of lines shown when scrolling
opt.ssop:remove('options')            -- do not store global and local values in a session
-- opt.ssop:remove('folds')              -- do not store folds
opt.list = true
opt.listchars:append "eol:↴"
-- opt.listchars:append "space:⋅"

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.relativenumber = true             -- Show relative line numbers
opt.number = true                     -- Show current line number
opt.showmatch = true                  -- Highlight matching parenthesis
opt.colorcolumn = '120'                -- Line lenght marker at 80 columns
opt.splitright = true                 -- Vertical split to the right
opt.splitbelow = true                 -- Orizontal split to the bottom
opt.ignorecase = true                 -- Ignore case letters when search
opt.smartcase = true                  -- Ignore lowercase for the whole pattern
opt.linebreak = true                  -- Wrap on word boundary
opt.termguicolors = true              -- Enable 24-bit RGB colors
opt.cmdheight = 1                     -- Give more space for displaying messages
opt.signcolumn= "yes:2"               -- Add two signs beside the line numbers
opt.laststatus = 3                    -- Use global / single status line
-- opt.cmdheight = 0                     -- hide the command line when not in use
vim.opt.splitkeep = "screen"          -- Default splitting will cause your main splits to jump when opening an edgebar

-----------------------------------------------------------
-- Tabs, indent, folds
-----------------------------------------------------------
opt.expandtab = true                  -- Use spaces instead of tabs
opt.shiftwidth = 2                    -- Shift 4 spaces when tab
opt.tabstop = 2                       -- 1 tab == 4 spaces
opt.smartindent = true                -- Autoindent new lines
opt.foldmethod = "expr"               -- Get folds from treesitter
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevelstart = 99               -- all folds open by default
opt.conceallevel = 2              -- to conceal orgmode links
opt.concealcursor = 'nc'

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true                     -- Enable background buffers
opt.history = 100                     -- Remember N lines in history
opt.lazyredraw = true                 -- Faster scrolling
opt.synmaxcol = 240                   -- Max column for syntax highlight
opt.updatetime = 400                  -- ms to wait for trigger 'document_highlight'

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------

-- Disable nvim intro
opt.shortmess:append "sI"

-- Disable builtins plugins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end

-----------------------------------------------------------
-- Autocommands
-----------------------------------------------------------

-- Remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]

-- Highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=800}
  augroup end
]], false)

-- Don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

-- 2 spaces for selected filetypes
cmd [[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
]]

-----------------------------------------------------------
-- Terminal
-----------------------------------------------------------

vim.g.floaterm_width = 0.95
vim.g.floaterm_height = 0.95

-- Open a terminal pane on the right using :Term
cmd [[command Term :botright vsplit term://$SHELL]]
cmd [[command TabTerm :tabedit term://$SHELL]]

-- Terminal visual tweaks:
--- enter insert mode when switching to terminal
--- close terminal buffer on process exit
cmd [[
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
    autocmd TermOpen * startinsert
    autocmd BufLeave term://* stopinsert
]]

-- Eslint on save
cmd [[
  autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
]]

-- Dynamic line numbers
autocmd({"BufEnter", "FocusGained", "WinEnter"}, {
  desc = "use absolute line numbers on unfocused buffer",
  command = "if &nu | set rnu   | endif",
})
autocmd({"BufLeave", "FocusLost", "WinLeave"}, {
  desc = "use relative line numbers on focused buffer",
  command = "if &nu | set nornu | endif",
})
