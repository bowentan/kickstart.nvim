return {
  {
    'catgoose/nvim-colorizer.lua',
    event = 'VeryLazy',
    opts = {
      lazy_load = true,
    },
    config = function()
      -- Disable by default
      local colorizer = require 'colorizer'
      if colorizer.is_buffer_attached() then
        colorizer.detach_from_buffer()
      end

      -- Add snacks toggle
      local has_snacks, _ = pcall(require, 'snacks')
      if not has_snacks then
        error 'snacks is not available, skip setting toggle for nvim-colorizer'
        return
      end

      Snacks.toggle
        .new({
          id = 'colorizer',
          name = 'Colorizer',
          get = function()
            return require('colorizer').is_buffer_attached()
          end,
          set = function(state)
            if state then
              require('colorizer').attach_to_buffer()
            else
              require('colorizer').detach_from_buffer()
            end
          end,
        })
        :map '<leader>ur'
    end,
  },
}
