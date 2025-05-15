return {
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      view = {
        relativenumber = true,
      },
    },
    keys = {
      {
        '<leader>e',
        ':NvimTreeToggle<CR>',
        mode = 'n',
        desc = 'Nvim Tree [E]xplorer',
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
