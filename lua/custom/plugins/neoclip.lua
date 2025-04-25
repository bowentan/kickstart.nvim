-- Clipboard manager

return {
  {
    'AckslD/nvim-neoclip.lua',
    dependencies = {
      -- you'll need at least one of these
      -- { 'nvim-telescope/telescope.nvim' },
      { 'ibhagwan/fzf-lua' },
    },
    config = function()
      require('neoclip').setup()
    end,
    keys = {
      {
        '<leader>sc',
        ':Neoclip<CR>',
        mode = 'n',
        desc = '[S]earch [C]lipboard',
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
