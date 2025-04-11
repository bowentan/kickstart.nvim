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
    end,
  },
}
