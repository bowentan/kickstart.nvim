-- REPL integration with SLIME

return {
  {
    'jpalardy/vim-slime',
    init = function()
      vim.g.slime_target = 'neovim'
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
