return {
  'vim-test/vim-test',
  keys = {
--  { "<leader>tf",  ":TestFile<cr>", desc="File" },
    { "<leader>tl",  ":TestLast<cr>", desc="Last" },
    { "<leader>tn",  ":TestNearest<cr>", desc="Nearest" },
    { "<leader>ts",  ":TestSuite<cr>", desc="Suite" },
    { "<leader>tv",  ":TestVisit<cr>", desc="Visit" },
    { "<leader>tdl",  ":TestLast --inspect=0.0.0.0:9228 | lua require'dap'.run(vim.g.dap_test_configuration)<cr>", desc="Last" },
    { "<leader>tdn",  ":TestNearest --inspect=0.0.0.0:9228 | lua require'dap'.run(vim.g.dap_test_configuration)<cr>", desc="Nearest" },
    { "<leader>tds",  ":TestSuite --inspect=0.0.0.0:9228 | lua require'dap'.run(vim.g.dap_test_configuration)<cr>", desc="Suite" },
    { "<leader>tdv",  ":TestVisit --inspect=0.0.0.0:9228 | lua require'dap'.run(vim.g.dap_test_configuration)<cr>", desc="Visit" },
  },
  config = function ()
    local g = vim.g
    g['test#strategy'] = "neovim"
    g['test#neovim#term_position'] = "botright"
    g['test#runner_commands'] = {'Mocha'}
    g['test#javascript#runner'] = 'mocha'

    -- Unit Tests
    g['test#javascript#mocha#executable'] = "docker-compose exec --env INVERSIFY_SCOPE='Request' --env LOG_LEVEL='debug' --env CONFIG_ENV=test lh-server npx ts-mocha --enable-source-maps"
    g['test#javascript#mocha#options'] = '--config tests/unit/mocharc.js'

    -- API Tests
    -- local dockerCompose = "docker-compose exec --env INVERSIFY_SCOPE='Request' --env LOG_LEVEL='debug' --env CONFIG_ENV=test "
    -- g['test#javascript#mocha#executable'] = "cd server; "
    --   .. dockerCompose .. "-T mysql mysql -uroot -p123123 < db/clear_test_db.sql; "
    --   .. dockerCompose .. "-T mongo mongo -uroot -p123123123 < ./db/clear_test_db.mongosh; "
    --   .. "npx knex --knexfile ./knexfile.js --env test migrate:latest; "
    --   .. "npx knex --knexfile ./knexfile.js --env test seed:run; "
    --   .. dockerCompose .. "lh-server npx migrate-mongo up; "
    --   .. dockerCompose .. "lh-server npx mocha"
    -- g['test#javascript#mocha#options'] = '--config tests/api/mocharc.js'
  end
}
