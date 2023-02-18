return {
  'vim-test/vim-test',
  config = function ()
    local g = vim.g
    g['test#strategy'] = "neovim"
    g['test#neovim#term_position'] = "botright"
    g['test#runner_commands'] = {'Mocha'}
    g['test#javascript#runner'] = 'mocha'
    g['test#javascript#mocha#executable'] = "docker-compose exec --env INVERSIFY_SCOPE='Request' lh-server mocha"
    g['test#javascript#mocha#options'] = '--config server.mocharc.js'
    -- g['test#javascript#mocha#options'] = '--config api.mocharc.js'
  end
}
