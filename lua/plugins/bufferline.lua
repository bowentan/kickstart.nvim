-- Buffer tabs
return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    config = function()
      local bufferline = require 'bufferline'
      bufferline.setup {
        options = {
          mode = 'tabs',
          style_preset = bufferline.style_preset.default,
          themable = true,
          modified_icon = '● ',
          close_icon = ' ',
          left_trunc_marker = ' ',
          right_trunc_marker = ' ',
          diagnostics = 'nvim_lsp',
          separator_style = 'slant',
          offsets = {
            {
              filetype = 'NvimTree',
              text = 'File Explorer',
              text_align = 'center',
              separator = true,
            },
          },
        },
      }
    end,
    keys = {
      {
        'g1',
        ':BufferLineGoToBuffer 1<CR>',
        mode = 'n',
        desc = '[G]o to buffer [1]',
      },
      {
        'g2',
        ':BufferLineGoToBuffer 2<CR>',
        mode = 'n',
        desc = '[G]o to buffer [2]',
      },
      {
        'g3',
        ':BufferLineGoToBuffer 3<CR>',
        mode = 'n',
        desc = '[G]o to buffer [3]',
      },
      {
        'g4',
        ':BufferLineGoToBuffer 4<CR>',
        mode = 'n',
        desc = '[G]o to buffer [4]',
      },
      {
        'g5',
        ':BufferLineGoToBuffer 5<CR>',
        mode = 'n',
        desc = '[G]o to buffer [5]',
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
