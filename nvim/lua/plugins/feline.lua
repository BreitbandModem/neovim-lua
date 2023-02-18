-- lualine?!
return {
  'famiu/feline.nvim', -- statusline
  dependencies = { 'kyazdani42/nvim-web-devicons' },
  config =function ()
    local vi_mode_utils = require 'feline.providers.vi_mode'

    -- My components
    local comps = {
      time = {
        provider = function ()
          return os.date("%H:%M")
        end,
      },
      -- vi_mode -> NORMAL, INSERT..
      vi_mode = {
        left = {
          provider = function()
            local label = ' '..vi_mode_utils.get_vim_mode()..' '
            return label
          end,
          hl = function()
            local set_color = {
              name = vi_mode_utils.get_mode_highlight_name(),
              bg = vi_mode_utils.get_mode_color(),
              style = 'bold',
            }
            return set_color
          end,
          left_sep = ' ',
          right_sep = ' ',
        }
      },
      -- Parse file information:
      file = {
        -- File name
        info = {
          provider = {
            name = 'file_info',
            opts = {
              type = 'relative',
              file_modified_icon = '',
            }
          },
          icon = '',
        },
        -- File type
        type = {
          provider = function()
            local type = vim.bo.filetype:lower()
            local extension = vim.fn.expand '%:e'
            local icon = require('nvim-web-devicons').get_icon(extension)
            if icon == nil then
              icon = ' '
            end
            return ' ' .. icon .. ' ' .. type
          end,
          left_sep = ' ',
          righ_sep = ' ',
        },
        -- Operating system
        os = {
          provider = function()
            local os = vim.bo.fileformat:lower()
            local icon
            if os == 'unix' then
              icon = '  '
            elseif os == 'mac' then
              icon = '  '
            else
              icon = '  '
            end
            return icon .. os
          end,
          --left_sep = ' ',
          right_sep = ' ',
        },
        -- Line-column
        position = {
          provider = { name = 'position' },
          hl = {
            style = 'bold',
          },
          left_sep = ' ',
          right_sep = ' ',
        },
        -- Cursor position in %
        line_percentage = {
          provider = { name = 'line_percentage' },
          hl = {
            style = 'bold',
          },
          left_sep = ' ',
          right_sep = ' ',
        },
        -- Simple scrollbar
        scroll_bar = {
          provider = { name = 'scroll_bar' },
          left_sep = ' ',
          right_sep = ' ',
        },
      },
      -- LSP info
      diagnos = {
        err = {
          provider = 'diagnostic_errors',
          icon = '⚠ ',
          left_sep = '  ',
        },
        warn = {
          provider = 'diagnostic_warnings',
          icon = ' ',
          left_sep = ' ',
        },
        info = {
          provider = 'diagnostic_info',
          icon = ' ',
          left_sep = ' ',
        },
        hint = {
          provider = 'diagnostic_hints',
          icon = ' ',
          left_sep = ' ',
        },
      },
      lsp = {
        name = {
          provider = 'lsp_client_names',
          icon = '  ',
          left_sep = '  ',
          right_sep = ' ',
        }
      },
      -- git info
      git = {
        branch = {
          provider = 'git_branch',
          icon = ' ',
          left_sep = '  ',
        },
        add = {
          provider = 'git_diff_added',
          icon = '  ',
          left_sep = ' ',
        },
        change = {
          provider = 'git_diff_changed',
          icon = '  ',
          left_sep = ' ',
        },
        remove = {
          provider = 'git_diff_removed',
          icon = '  ',
          left_sep = ' ',
        }
      }
    }

    -- Get active/inactive components
    --- see: https://github.com/famiu/feline.nvim/blob/master/USAGE.md#components
    local components = {
      active = {},
      inactive = {},
    }

    table.insert(components.active, {})
    table.insert(components.active, {})
    table.insert(components.active, {})
    table.insert(components.inactive, {})
    table.insert(components.inactive, {})
    table.insert(components.inactive, {})

    -- Left section
    table.insert(components.active[1], comps.vi_mode.left)
    table.insert(components.active[1], comps.file.info)
    table.insert(components.active[1], comps.git.branch)
    table.insert(components.active[1], comps.git.add)
    table.insert(components.active[1], comps.git.change)
    table.insert(components.active[1], comps.git.remove)
    table.insert(components.inactive[1], comps.file.info)

    -- Middle section
    table.insert(components.active[2], comps.time)
    table.insert(components.inactive[2], comps.time)

    -- Right Section
    table.insert(components.active[3], comps.diagnos.err)
    table.insert(components.active[3], comps.diagnos.warn)
    table.insert(components.active[3], comps.diagnos.hint)
    table.insert(components.active[3], comps.diagnos.info)
    -- table.insert(components.active[3], comps.lsp.name)
    table.insert(components.active[3], comps.file.type)
    -- table.insert(components.active[3], comps.file.os)
    table.insert(components.active[3], comps.file.position)
    table.insert(components.active[3], comps.file.line_percentage)

    -- Call feline
    require('feline').setup {
      components = components,
      force_inactive = {
        filetypes = {
          '^NvimTree$',
          '^packer$',
          '^vista$',
          '^help$',
        },
        buftypes = {
          '^terminal$'
        },
        bufnames = {},
      },
    }

    require('feline').winbar.setup()
  end
}



