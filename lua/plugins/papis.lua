return {
  {
    -- 'jghauser/papis.nvim',
    'bowentan/papis.nvim',
    branch = 'feat/snacks-picker',
    dependencies = {
      'kkharji/sqlite.lua',
      'MunifTanjim/nui.nvim',
      'pysan3/pathlib.nvim',
      'nvim-neotest/nvim-nio',
      -- if not already installed, you may also want:
      -- 'nvim-telescope/telescope.nvim',
      'folke/snacks.nvim',
    },
    config = function()
      require('papis').setup {
        -- Your configuration goes here
        enable_modules = {
          ['completion'] = false,
        },
        init_filetypes = { 'markdown', 'norg', 'yaml', 'typst', 'tex', 'rmd' },
        enable_keymaps = true,
        db_path = '~/papis/papis.sqlite3',
        ['search'] = {
          provider = 'snacks',
        },
      }
    end,
  },
}
