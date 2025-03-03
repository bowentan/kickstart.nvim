return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    lazy = false,
    requires = { 'nvim-lua/plenary.nvim' }, -- if harpoon requires this
    config = function()
      require('harpoon').setup {}

      local function toggle_telescope_with_harpoon(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require('telescope.pickers')
          .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table {
              results = file_paths,
            },
            previewer = require('telescope.config').values.file_previewer {},
            sorter = require('telescope.config').values.generic_sorter {},
          })
          :find()
      end
      vim.keymap.set('n', '<leader>mo', function()
        local harpoon = require 'harpoon'
        toggle_telescope_with_harpoon(harpoon:list())
      end, { desc = 'Open harpoon window' })
    end,
    keys = {
      {
        '<leader>ma',
        function()
          require('harpoon'):list():add()
        end,
        mode = 'n',
        desc = 'Harpoon file [A]ppend',
      },
      {
        '<leader>ml',
        function()
          local harpoon = require 'harpoon'
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        mode = 'n',
        desc = 'Harpoon quick menu',
      },
      {
        '<leader>mp',
        function()
          require('harpoon'):list():prev()
        end,
        mode = 'n',
        desc = 'Harpoon [P]revious',
      },
      {
        '<leader>mn',
        function()
          require('harpoon'):list():next()
        end,
        mode = 'n',
        desc = 'Harpoon [N]ext',
      },
      {
        '<leader>m1',
        function()
          require('harpoon'):list():select(1)
        end,
        mode = 'n',
        desc = 'Harpoon to file 1',
      },
      {
        '<leader>m2',
        function()
          require('harpoon'):list():select(2)
        end,
        mode = 'n',
        desc = 'Harpoon to file 2',
      },
      {
        '<leader>m3',
        function()
          require('harpoon'):list():select(3)
        end,
        mode = 'n',
        desc = 'Harpoon to file 3',
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
