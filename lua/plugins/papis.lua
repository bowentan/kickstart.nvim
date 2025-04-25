return {
  {
    'jghauser/papis.nvim',
    dev = true,
    dependencies = {
      'kkharji/sqlite.lua',
      'MunifTanjim/nui.nvim',
      'pysan3/pathlib.nvim',
      'nvim-neotest/nvim-nio',
      -- if not already installed, you may also want:
      -- 'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('papis').setup {
        -- Your configuration goes here
        enable_modules = {
          ['completion'] = false,
        },
        enable_keymaps = true,
        db_path = '~/papis/papis.sqlite3',
      }
    end,
  },
}
