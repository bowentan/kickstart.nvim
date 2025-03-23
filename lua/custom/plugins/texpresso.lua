return {
  {
    'let-def/texpresso.vim',
    cmd = 'TeXpresso',
    config = function()
      local texpresso = require 'texpresso'
      texpresso.texpresso_path = vim.fn.exepath 'texpresso'
      texpresso.attach()
    end,
  },
}
