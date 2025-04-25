return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    init = function()
      vim.cmd [[
        colorscheme tokyonight-moon
      ]]
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
