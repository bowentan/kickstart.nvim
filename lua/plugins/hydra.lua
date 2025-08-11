-- Description: Hydra plugin configuration for Neovim
-- Used for creating shortcuts and command sequences
return {
  {
    'nvimtools/hydra.nvim',
    config = function()
      local Hydra = require 'hydra'

      Hydra {
        name = 'Resize Window',
        mode = { 'n' },
        body = '<C-w>',
        config = {
          -- color = "pink",
        },
        heads = {
          -- resizing window
          { 'H', '<C-w>3<' },
          { 'L', '<C-w>3>' },
          { 'K', '<C-w>2+' },
          { 'J', '<C-w>2-' },

          -- equalize window sizes
          -- { 'e', '<C-w>=' },

          -- close active window
          -- { 'Q', ':q<cr>' },
          -- { '<C-q>', ':q<cr>' },

          -- exit this Hydra
          { 'q', nil, { exit = true, nowait = true } },
          { ';', nil, { exit = true, nowait = true } },
          { '<Esc>', nil, { exit = true, nowait = true } },
        },
      }
    end,
  },
}
