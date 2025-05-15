return {
  {
    'hedyhli/outline.nvim',
    lazy = true,
    cmd = { 'Outline', 'OutlineOpen' },
    keys = { -- Example mapping to toggle outline
      {
        '<leader>uo',
        '<cmd>Outline<CR>',
        mode = 'n',
        desc = 'Toggle outline',
      },
    },
    opts = {
      -- Your setup opts here
      outline_window = {
        width = 15,
        show_relative_numbers = true,
      },
    },
  },
}
