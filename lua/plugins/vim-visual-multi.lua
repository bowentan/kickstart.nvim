return {
  {
    'mg979/vim-visual-multi',
    init = function()
      local wk = require 'which-key'
      wk.add {
        {
          mode = 'n',
          { '<M-Down>', '<Plug>(VM-Add-Cursor-Down)', desc = 'Add cursor down' },
          { '<M-Up>', '<Plug>(VM-Add-Cursor-Up)', desc = 'Add cursor up' },
        },
      }
    end,
  },
}
