return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        size = function(term)
          if term.direction == 'horizontal' then
            return 50
          elseif term.direction == 'vertical' then
            return vim.o.columns * 0.33
          end
        end,
        hide_numbers = true, -- hide the number column in toggleterm buffers
        shade_terminals = true,
        shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
        start_in_insert = true,
        insert_mappings = true, -- whether or not the open mapping applies in insert mode
        persist_size = true,
        close_on_exit = true, -- close the terminal window when the process exits
        shell = vim.o.shell, -- change the default shell
        float_opts = {
          border = 'single',
          width = 200,
          height = 50,
          winblend = 3,
          highlights = {
            border = 'Normal',
            background = 'Normal',
          },
        },
      }
    end,
    keys = {
      {
        '<leader>Tv',
        ':ToggleTerm direction=vertical<CR>',
        mode = 'n',
        desc = 'ToggleTerm [V]ertical',
      },
      {
        '<leader>Th',
        ':ToggleTerm direction=horizontal<CR>',
        mode = 'n',
        desc = 'ToggleTerm [H]orizontal',
      },
      {
        '<leader>Tf',
        ':ToggleTerm direction=float<CR>',
        mode = 'n',
        desc = 'ToggleTerm [F]loat',
      },
      {
        '<leader>Ts',
        ':TermSelect<CR>',
        mode = 'n',
        desc = 'ToggleTerm [S]elect',
      },
      {
        '<C-c><C-c>',
        function()
          require('toggleterm').send_lines_to_terminal('single_line', false, { args = vim.v.count })
        end,
        mode = 'n',
        desc = 'Send line with cursor to terminal',
      },
      {
        '<C-c><C-c>',
        function()
          require('toggleterm').send_lines_to_terminal('visual_selection', false, { args = vim.v.count })
        end,
        mode = 'v',
        desc = 'Send visual lines to terminal',
      },
    },
  },
}
