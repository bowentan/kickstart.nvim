-- Replaces the UI for messages, cmdline and the popupmenu
return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
    config = function()
      require('noice').setup {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = false, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = false, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = true, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add a border to hover docs and signature help
        },
      }
    end,
    keys = {
      {
        '<leader>nc',
        function()
          require('noice').cmd 'config'
        end,
        mode = 'n',
        desc = 'Noice Config',
      },
      {
        '<leader>nd',
        function()
          require('noice').cmd 'debug'
        end,
        mode = 'n',
        desc = 'Noice Debug',
      },
      {
        '<leader>ne',
        function()
          require('noice').cmd 'errors'
        end,
        mode = 'n',
        desc = 'Noice Error',
      },
      {
        '<leader>ns',
        function()
          require('noice').cmd 'snacks'
        end,
        mode = 'n',
        desc = 'Noice Search',
      },
      {
        '<leader>nl',
        function()
          require('noice').cmd 'last'
        end,
        mode = 'n',
        desc = 'Noice Last',
      },
      {
        '<leader>na',
        function()
          require('noice').cmd 'all'
        end,
        mode = 'n',
        desc = 'Noice All',
      },
      {
        '<C-C>',
        function()
          local nldocs = require 'noice.lsp.docs'
          local message = nldocs.get 'signature'
          nldocs.hide(message)
        end,
        mode = 'i',
        desc = 'Noice Signature Close',
      },
    },
  },
}
