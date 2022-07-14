----------------------------------------------------------
-- Vim-Test configuration file
-----------------------------------------------------------

-- Plugin: vim-test
-- url: https://github.com/vim-test/vim-test


local g = vim.g

g['test#strategy'] = "neovim"
g['test#neovim#term_position'] = "botright"
g['test#runner_commands'] = {'Mocha'}
g['test#javascript#runner'] = 'mocha'
g['test#javascript#mocha#executable'] = 'docker-compose exec lh-server mocha'
g['test#javascript#mocha#options'] = '--config server.mocharc.js'