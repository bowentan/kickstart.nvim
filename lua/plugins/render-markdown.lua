return {
  {
    -- Make sure to set this up properly if you have lazy=true
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown', 'Avante' },
    opts = {
      file_types = { 'markdown', 'Avante' },
    },
    config = function(_, opts)
      require('render-markdown').setup(opts)

      -- Add snacks toggle
      local has_snacks, _ = pcall(require, 'snacks')
      if not has_snacks then
        error 'snacks is not available, skip setting toggle for render-markdown'
        return
      end

      Snacks.toggle
        .new({
          id = 'render-markdown-all',
          name = 'Render markdown all',
          get = function()
            return require('render-markdown.state').enabled
          end,
          set = function(state)
            require('render-markdown.manager').set_all(state)
          end,
        })
        :map '<leader>uMa'
      Snacks.toggle
        .new({
          id = 'render-markdown-current',
          name = 'Render markdown current',
          get = function()
            local buf = require('render-markdown.lib.env').buf.current()
            return require('render-markdown.state').get(buf).enabled
          end,
          set = function(state)
            require('render-markdown.manager').set_current(state)
          end,
        })
        :map '<leader>uMc'

      require('which-key').add {
        { '<leader>uM', desc = 'Render markdown' },
      }
    end,
  },
}
