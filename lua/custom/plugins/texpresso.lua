return {
  {
    'let-def/texpresso.vim',
    lazy = false,
    cmd = 'TeXpresso',
    config = function()
      require('texpresso').texpresso_path = vim.fn.exepath 'texpresso'
    end,
  },
}
