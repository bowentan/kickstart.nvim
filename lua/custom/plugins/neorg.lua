return {
  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    opts = {
      load = {
        ['core.keybinds'] = {
          config = {
            default_keybinds = true,
          },
        },
        ['core.defaults'] = {}, -- Loads default behaviour
        ['core.concealer'] = {}, -- Adds pretty icons to your documents
        ['core.dirman'] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = '~/notes',
            },
            default_workspace = 'notes',
          },
        },
      },
    },
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      {
        'nvim-treesitter/nvim-treesitter',
        opts = {
          auto_install = true,
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },
        },
        config = function(_, opts)
          require('nvim-treesitter.configs').setup(opts)
        end,
      },
    },
    init = function()
      local wk = require 'which-key'
      wk.add {
        {
          mode = 'n',
          {
            group = 'Neorg navigation',
            { '<leader>ni', '<cmd>Neorg index<cr>', desc = 'Neorg index' },
            { '<leader>nr', '<cmd>Neorg return<cr>', desc = 'Neorg return' },
          },

          {
            group = 'Neorg mode',
            { '<leader>nmm', '<cmd>Neorg<cr>', mode = 'n', desc = 'Neorg [M]enu' },
            { '<leader>nmn', '<cmd>Neorg mode norg<cr>', mode = 'n', desc = 'Neorg enter [N]eorg mode' },
            { '<leader>nmh', '<cmd>Neorg mode traverse-heading<cr>', mode = 'n', desc = 'Neorg [H]eading traversal mode' },
            { '<leader>nml', '<cmd>Neorg mode traverse-link<cr>', mode = 'n', desc = 'Neorg [L]ink traversal mode' },
          },

          {
            group = 'Neorg journal',
            { '<leader>njd', '<cmd>Neorg journal date<cr>', desc = 'Neorg journal [d]ate' },
            { '<leader>njt', '<cmd>Neorg journal today<cr>', desc = 'Neorg journal [t]oday' },
            { '<leader>njm', '<cmd>Neorg journal tomorrow<cr>', desc = 'Neorg journal to[m]orrow' },
            { '<leader>njy', '<cmd>Neorg journal yesterday<cr>', desc = 'Neorg journal [y]esterday' },
            { '<leader>njc', '<cmd>Neorg journal custom<cr>', desc = 'Neorg journal [c]ustom date' },
            { '<leader>njo', '<cmd>Neorg journal toc open<cr>', desc = 'Neorg [o]pen journal table of contents' },
            { '<leader>nju', '<cmd>Neorg journal toc update<cr>', desc = 'Neorg [u]pdate journal table of contents' },
          },

          {
            group = 'Neorg task',
            { '<leader>nts', '<cmd>Neorg keybind norg core.qol.todo_items.todo.task_cycle<cr>', desc = 'Neorg cycle task [s]tate' },
            { '<leader>ntS', '<cmd>Neorg keybind norg core.qol.todo_items.todo.task_cycle_reverse<cr>', desc = 'Neorg reverse cycle task state' },
            { '<leader>ntn', 'i- ( ) ', desc = 'Neorg [n]ew Task' },
            { '<leader>ntd', '<cmd>Neorg keybind norg core.qol.todo_items.todo.task_done<cr>', desc = 'Neorg mark task [d]one' },
            { '<leader>nt', '<cmd>Neorg keybind norg core.qol.todo_items.todo.task_undone<cr>', desc = 'Neorg mark task [u]ndone' },
            { '<leader>nt', '<cmd>Neorg keybind norg core.qol.todo_items.todo.task_pending<cr>', desc = 'Neorg mark task [p]ending' },
            { '<leader>nt', '<cmd>Neorg keybind norg core.qol.todo_items.todo.task_on_hold<cr>', desc = 'Neorg mark task on [h]old' },
            { '<leader>nt', '<cmd>Neorg keybind norg core.qol.todo_items.todo.task_cancelled<cr>', desc = 'Neorg mark task [c]ancelled' },
            { '<leader>nt', '<cmd>Neorg keybind norg core.qol.todo_items.todo.task_important<cr>', desc = 'Neorg mark task [i]mportant' },
            { '<leader>nt', '<cmd>Neorg keybind norg core.qol.todo_items.todo.task_recurring<cr>', desc = 'Neorg mark task [r]ecurring' },
          },
        },
      }
    end,
  },
}
