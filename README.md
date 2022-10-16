## TODO:
- install harpoon
- install telescope-frecency
- explore LuaSnip plugin
- refactor lua autocommands
- explore nvim-dap-virtual-text plugin
- eslint plugin (null-ls eslint command takes forever)

<p align="center">
<img src="img/logo.png" alt="neovim-lua_logo">
</p>

<h3 align="center">
Neovim KISS configuration with Lua
</h3>

## Plugins

[packer.nvim](https://github.com/wbthomason/packer.nvim) -  A use-package inspired plugin manager for Neovim

[nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) - A File Explorer written In Lua

[indentBlankline](https://github.com/lukas-reineke/indent-blankline.nvim) - Adds indentation guides to all lines (including empty lines)

[feline.nvim](https://github.com/Famiu/feline.nvim) - A minimal, stylish and customizable statusline for Neovim written in Lua

[nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) - A Lua fork of vim-devicons

[vista.vim](https://github.com/liuchengxu/vista.vim) - View and search LSP symbols, tags in Vim/NeoVim

[nvim-telescope](https://github.com/nvim-telescope/telescope.nvim) - A fuzzy finder

[telescope-ui-select](https://github.com/nvim-telescope/telescope-ui-select.nvim) - Use telescope for vim ui.select

[gitsigns](https://github.com/lewis6991/gitsigns.nvim) - Super fast git decorations implemented purely in lua/teal

[alpha-nvim](https://github.com/goolord/alpha-nvim) - A fast and highly customizable greeter for neovim.

[comment](https://github.com/numToStr/Comment.nvim) - Comment code

[glow](https://github.com/ellisonleao/glow.nvim) - Open glow markdown preview in popup window

[vim-test](https://github.com/vim-test/vim-test) - Unit Test execution from neovim

[zen-mode](https://github.com/folke/zen-mode.nvim) - Distraction free coding by maximizing current buffer

[which-key](https://github.com/folke/which-key.nvim) - Display key bindings for commands

[nvim-dap](https://github.com/mfussenegger/nvim-dap) - Debug Adapter Protocol client implementation for Neovim

[nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) - Visual interface for the DAP plugin

[yanky](https://github.com/gbprod/yanky.nvim) - Yank history

[neovim-session-manager](https://github.com/Shatur/neovim-session-manager) - Session Manager

[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Nvim LSP Config

[nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - LSP Autocompletion

[LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet Tool

[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Treesitter language parser

[nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) - Show function context

[nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Auto pairs plugin

[null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) - Plugins for LSP; e.g. eslint

## Directory Tree of Lua Files

`${HOME}/.config/nvim`

```
├── lua
│   ├── core
│   │   ├── colors.lua
│   │   ├── keymaps.lua
│   │   └── settings.lua
│   ├── plugins
│   │   └── pluginXYZ.lua
│   └── packer_init.lua
├── plugin
│   └── packer_compiled.lua
└── init.lua
```

## Files and Settings

`/nvim`

* [init.lua](nvim/init.lua): Main configuration file that call `lua` modules

* [coc-settings.json](nvim/coc-settings.json): Configuration file for coc framework

* [lua](nvim/lua): Folder of `lua` modules, here reside all the Lua modules that needed. These modules are called from `init.lua` file (see below).

See: https://github.com/nanotee/nvim-lua-guide#where-to-put-lua-files

`/nvim/lua`

* [packer_init.lua](nvim/lua/packer_init.lua): Load plugins

* [plugins](/nvim/lua/plugins): Plugin specific configuration and setup

`/nvim/lua/core`

* [settings.lua](nvim/lua/core/settings.lua): General Neovim settings and configuration

* [keymaps.lua](nvim/lua/core/keymaps.lua): Keymaps configuration file, vim/neovim and plugins keymaps.

* [colors.lua](nvim/lua/core/colors.lua): Define Neovim and plugins color scheme


## Appearance

**Colorschemes:**

* [OneDark](https://github.com/navarasu/onedark.nvim)

* [Neovim Monokai](https://github.com/tanvirtin/monokai.nvim)

* [Rose Pine](https://github.com/rose-pine/neovim)

**Fonts:** [Cozette](https://github.com/slavfox/Cozette)

**Icons:** [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)

## Screenshots

<p align="center">
<img src="img/banner.png">
</p>

<details><summary> <b>(Click to expand)</b></summary>

**OneDark (darker)**

![onedark_1](img/1-onedark_1.png)

![onedark_2](img/2-onedark_2.png)

**Monokai**

![monokai_1](img/3-monokai_1.png)

![monokai_2](img/4-monokai_2.png)

**Rosé Pine**

![rose-pine_1](img/5-rose-pine_1.png)

![rose-pine-2](img/6-rose-pine_2.png)

</details>

## Installation

1. Install [neovim v0.6.x](https://github.com/neovim/neovim/releases/latest)

```term
brew install neovim
```

2. Install [npm](https://github.com/npm/cli) (for download the packages of LSP language servers)

3. Clone this repo and link it to the nvim config.

```term
git clone https://github.com/BreitbandModem/neovim-lua.git /Users/****/github/neovim-lua
ln -s /Users/****/github/neovim-lua/nvim /Users/****/.config/nvim
```

4. Install some plugin dependencies

```term
# ripgrep is required for telescope
brew install ripgrep

# glow is required for markdown preview
brew install glow

# Install node-debug2 for the dap plugin
git clone https://github.com/microsoft/vscode-node-debug2.git
cd vscode-node-debug2
npm install
NODE_OPTIONS=--no-experimental-fetch npm run build

# Install a custom font to support icons
brew tap homebrew/cask-fonts
brew install font-jetbrains-mono-nerd-font
```

Configure the newly installed font in the terminal app (e.g. iterm2).

Make sure that the debug adapter config in [dap.lua](nvim/lua/plugins/dap.lua) points to the path of the cloned vscode-node-debug2 repo.

4. Install LSP language servers

```term
npm install -g typescript typescript-language-server
brew install lua-language-server
```

5. Install [packer.nvim](https://github.com/wbthomason/packer.nvim) for install and manage plugins:

```term
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Open Neovim and run `:PackerSync` command.

See: https://github.com/wbthomason/packer.nvim#quickstart

6. Install treesitter language parsers

```term
:TSInstall typescript javascript gitignore regex css json vim lua markdown_inline http vue yaml
```

7. Specific fix for running mocha tests on a docker container using the vim-test plugin

Remove the additional arguments added by the vim-test mocha plugin source code:

```~/.local/share/nvim/site/pack/packer/start/vim-test/autoload/test/javascript/mocha.vim```

### Languages Currently Supported

Lua - [builtin](https://neovim.io/doc/user/lua.html)

Bash - [bashls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls)

Python - [pyright](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright)

C, C++, CSS - [clangd](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd)

HTML, CSS, JSON - [vscode-html](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html)

JavaScript, TypeScript - [tsserver](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver)

See: [nvim-lspconfig #doc/server_configurations.md](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

## Set Color Scheme

The color scheme is defined in the following files (default: OneDark):

* Neovim UI - [nvim/lua/core/settings.lua](nvim/lua/core/settings.lua):

```lua
-- Load colorscheme
require('onedark').setup {
    style = 'darker'
}
require('onedark').load()
```

* Statusline - [nvim/lua/plugins/feline.lua](nvim/lua/plugins/feline.lua):

```lua
-- Set colorscheme (from core/colors.lua/colorscheme_name)
local colors = require('core/colors').onedark
```

## Configuration check

- Open nvim and run command `checkhealth`, you should not see any error in the output (except for the one related to the Python 2 interpreter if don't have it):

```vim
:checkhealth
```

![.](img/checkhealth.png)

- You can also use the `startuptime` option to read the nvim startup logs:

```term
nvim --startuptime > /tmp/nvim-start.log

nvim /tmp/nvim-start.log
```

See: `:help startuptime`

## Guides and resources

* https://neovim.io/doc/user/lua.html

* https://github.com/nanotee/nvim-lua-guide

* https://dev.to/vonheikemen/everything-you-need-to-know-to-configure-neovim-using-lua-3h58

* https://www.old.reddit.com/r/neovim/

## Other Neovim Lua projects and examples

* https://github.com/siduck76/NvChad

* https://github.com/artart222/CodeArt

* https://github.com/crivotz/nv-ide

## Lua resources

* Lua in Y minutes - https://learnxinyminutes.com/docs/lua/

* Lua Quick Guide - https://github.com/medwatt/Notes/blob/main/Lua/Lua_Quick_Guide.ipynb

* Lua 5.4 Reference Manual - https://www.lua.org/manual/5.4/

## Disclaimer

As all my setups I try to follow the [KISS](https://en.wikipedia.org/wiki/KISS_principle) principle, probably some concepts may not be valid for everyone.
Then feel free to take what you need but **don't install anything without checking first!**

---

**Thanks to all the authors of the sources mentioned above and to all the others from whom I "stole" some configs :)**
