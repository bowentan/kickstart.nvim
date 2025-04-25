-- plugins/quarto.lua
return {
  {
    'quarto-dev/quarto-nvim',
    lazy = true,
    dependencies = {
      'jmbuhr/otter.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    ft = { 'quarto', 'markdown' },
    opts = {
      lspFeatures = {
        languages = { 'r', 'python', 'rust' },
        chunks = 'all',
        diagnostics = {
          enabled = true,
          triggers = { 'BufWritePost' },
        },
        completion = {
          enabled = true,
        },
      },
      -- keymap = {
      --   hover = 'H',
      --   definition = 'gd',
      --   rename = '<leader>rn',
      --   references = 'gr',
      --   format = '<leader>gf',
      -- },
      codeRunner = {
        enabled = true,
        default_method = 'molten',
      },
    },
    keys = {
      {
        '<localleader>rc',
        function()
          require('quarto.runner').run_cell()
        end,
        mode = 'n',
        desc = 'Run cell',
        silent = true,
      },
      {
        '<localleader>ra',
        function()
          require('quarto.runner').run_above()
        end,
        mode = 'n',
        desc = 'Run cell and above',
        silent = true,
      },
      {
        '<localleader>rA',
        function()
          require('quarto.runner').run_all()
        end,
        mode = 'n',
        desc = 'Run all cells',
        silent = true,
      },
      {
        '<localleader>rl',
        function()
          require('quarto.runner').run_line()
        end,
        mode = 'n',
        desc = 'Run line',
        silent = true,
      },
      {
        '<localleader>r',
        function()
          require('quarto.runner').run_range()
        end,
        mode = 'v',
        desc = 'Run visual range',
        silent = true,
      },
      {
        '<localleader>RA',
        function()
          require('quarto.runner').run_all(true)
        end,
        mode = 'n',
        desc = 'Run all cells of all languages',
        silent = true,
      },
    },
  },
  {
    'bowentan/molten-nvim',
    lazy = true,
    ft = { 'quarto', 'markdown' },
    branch = 'feat/add-snacks-support',
    -- version = '^1.0.0', -- use version <2.0.0 to avoid breaking changes
    build = ':UpdateRemotePlugins',
    init = function()
      -- this is an example, not a default. Please see the readme for more configuration options
      vim.g.molten_image_provider = 'snacks.nvim'
      -- vim.g.molten_output_win_max_height = 1000
      vim.g.molten_virt_text_max_lines = 200
      vim.g.molten_auto_open_output = false
      vim.g.molten_wrap_output = true
      vim.g.molten_virt_text_output = false
      vim.g.molten_virt_lines_off_by_1 = true
    end,
    keys = {
      {
        '<localleader>mi',
        ':MoltenInit<CR>',
        mode = 'n',
        desc = 'Initialize the plugin',
        silent = true,
      },
      {
        '<localleader>rr',
        ':MoltenReevaluateCell<CR>',
        mode = 'n',
        desc = 'Re-eval cell',
        silent = true,
      },
      {
        '<localleader>e',
        ':MoltenEvaluateOperator<CR>',
        mode = 'n',
        desc = 'Evaluate operator',
        silent = true,
      },
      {
        '<localleader>r',
        ':<C-u>MoltenEvaluateVisual<CR>gv',
        mode = 'v',
        desc = 'Execute visual selection',
        silent = true,
      },
      {
        '<localleader>oo',
        ':noautocmd MoltenEnterOutput<CR>',
        mode = 'n',
        desc = 'Open output window',
        silent = true,
      },
      {
        '<localleader>oc',
        ':MoltenHideOutput<CR>',
        mode = 'n',
        desc = 'Close output window',
        silent = true,
      },
      {
        '<localleader>md',
        ':MoltenDelete<CR>',
        mode = 'n',
        desc = 'Delete Molten cell',
        silent = true,
      },
      {
        '<localleader>ob',
        ':MoltenOpenInBrowser<CR>',
        mode = 'n',
        desc = 'Open output in browser',
        silent = true,
      },
      {
        '<localleader>op',
        ':MoltenImagePopup<CR>',
        mode = 'n',
        desc = 'Open output in popup',
        silent = true,
      },
      {
        '<localleader>oI',
        ':MoltenInterrupt<CR>',
        mode = 'n',
        desc = 'Interrupt execution',
        silent = true,
      },
    },
  },
  {
    'GCBallesteros/jupytext.nvim',
    config = function()
      require('jupytext').setup {
        style = 'markdown',
        output_extension = 'md',
        force_ft = 'markdown',
      }
    end,
  },
}
