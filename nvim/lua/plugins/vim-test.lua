return {
  'vim-test/vim-test',
  config = function ()
    local g = vim.g
    g['test#strategy'] = "neovim"
    g['test#neovim#term_position'] = "botright"
    g['test#runner_commands'] = {'Mocha'}
    g['test#javascript#runner'] = 'mocha'

    -- Unit Tests
    g['test#javascript#mocha#executable'] = "docker-compose exec --env INVERSIFY_SCOPE='Request' --env LOG_LEVEL='debug' lh-server npx ts-mocha --enable-source-maps"
    g['test#javascript#mocha#options'] = '--config tests/unit/mocharc.js'

    -- API Tests
    -- g['test#javascript#mocha#executable'] = "docker-compose exec --env INVERSIFY_SCOPE='Request' --env LOG_LEVEL='debug' --env CONFIG_ENV=local lh-server npx mocha"
    -- g['test#javascript#mocha#options'] = '--config tests/api/mocharc.js'
  end
}
