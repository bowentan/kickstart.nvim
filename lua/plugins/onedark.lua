return {
  {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup {
        style = 'dark',
      }
    end,
    init = function()
      vim.cmd [[
        colorscheme onedark
      ]]
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
