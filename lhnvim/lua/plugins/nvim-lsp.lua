return {
  'neovim/nvim-lspconfig',
  lazy = false,
  keys = {
    { "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc="Code Action" },
    { "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", desc="Code Action" },
 -- { "<leader>f", "<cmd>lua vim.lsp.buf.format({name=eslint, async=true})<CR>", desc="Format Code" },
    { "<leader>i", "<cmd>lua if vim.lsp.inlay_hint.is_enabled() then vim.lsp.inlay_hint.enable(false, { bufnr }) else vim.lsp.inlay_hint.enable(true, { bufnr }) end <cr>", desc="Inlay Hints" },
    { "<leader>rf", ":EslintFixAll<CR>", desc="Format Code" },
    { "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", desc="Format Code" },
    { "K", "<cmd>lua vim.lsp.buf.hover()<CR>", desc="Symbol Info" },
    { "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc="Previous Code Action" },
    { "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc="Next Code Action" },
    -- <c-k> conflicts with the split window navigation (window up). As signature_help doesn't seem useful for now, I disable it
    -- ["<c-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Info" },
    { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc="Definition" },
    { "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc="Declaration" },
    { "gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc="References" },
    { "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc="Implementation" },
  },
  config = function ()
    --[[
    -- Mappings TODO: check if I want any of these:
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    ]]

    -- enable ts-error-translations manually
    vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
      require("ts-error-translator").translate_diagnostics(err, result, ctx, config)
      vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
    end

    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
      vim.lsp.inlay_hint.enable(false, { bufnr }) -- disable by default

      vim.bo[bufnr].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
      -- highlight symbol under cursor
      if client.server_capabilities.documentHighlightProvider then
        --[[ vim.cmd [[
          hi! LspReferenceRead cterm=bold ctermbg=red guibg=#4f4f4f
          hi! LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
          hi! LspReferenceWrite cterm=bold ctermbg=red guibg=#707070
        ]] --]]
        vim.api.nvim_create_augroup('lsp_document_highlight', {
          clear = false
        })
        vim.api.nvim_clear_autocmds({
          buffer = bufnr,
          group = 'lsp_document_highlight',
        })
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          group = 'lsp_document_highlight',
          buffer = bufnr,
          callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd('CursorMoved', {
          group = 'lsp_document_highlight',
          buffer = bufnr,
          callback = vim.lsp.buf.clear_references,
        })
      end
    end

    require('lspconfig').lua_ls.setup {
      on_attach = on_attach,
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
    }

    require('lspconfig').ts_ls.setup {
      on_attach = on_attach,
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = 'all',
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = false,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          }
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = 'all',
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = false,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          }
        }
      },
      -- enable once we go for vue3
      -- init_options = {
      --   plugins = {
      --     {
      --       name = '@vue/typescript-plugin',
      --       location = '~/.nvm/versions/node/v18.18.0/lib/node_modules/@vue/typescript-plugin',
      --       languages = { 'vue' },
      --     },
      --   },
      -- },
      -- filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    }

    require 'lspconfig'.eslint.setup {
      -- cmd = { "vscode-eslint-language-server", "--stdio", "--rulesdir eslint_rules", "--ext .js,.ts,.ejs" },
      settings = {
        codeAction = {
          disableRuleComment = {
            enable = true,
            location = "separateLine"
          },
          showDocumentation = {
            enable = true
          }
        },
        codeActionOnSave = {
          enable = false,
          mode = "all"
        },
        -- experimental = {
        --   useFlatConfig = true
        -- },
        format = true,
        nodePath = "",
        onIgnoredFiles = "off",
        packageManager = "npm",
        problems = {
          shortenToSingleLine = false
        },
        quiet = false,
        rulesCustomizations = {},
        run = "onType",
        useESLintClass = false,
        validate = "on",
        workingDirectory = {
          mode = "location"
        },
        -- workingDirectories = {
        --   { directory = "./server", },
        --   { directory = "./client", }
        -- }
      }
    }

    -- require'lspconfig'.vuels.setup {}
    -- No need to set `hybridMode` to `true` as it's the default value
    require 'lspconfig'.volar.setup {}
  end
}
