return {
  {
    'L3MON4D3/LuaSnip',
    build = (function()
      -- Build Step is needed for regex support in snippets.
      -- This step is not supported in many windows environments.
      -- Remove the below condition to re-enable on windows.
      if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
        return
      end
      return 'make install_jsregexp'
    end)(),
    config = function(_, opts)
      if opts then
        require('luasnip').config.setup(opts)
      end
      vim.tbl_map(function(type)
        require('luasnip.loaders.from_' .. type).lazy_load()
      end, { 'vscode', 'snipmate', 'lua' })
    end,
    keys = {
      {
        '<C-J>',
        function()
          require('luasnip').jump(1)
        end,
        mode = { 'i', 's' },
        desc = 'Jumping forward',
        { silence = true },
      },
      {
        '<C-K>',
        function()
          require('luasnip').jump(-1)
        end,
        mode = { 'i', 's' },
        desc = 'Jumping backward',
        { silence = true },
      },
      {
        '<C-C>',
        function()
          local ls = require 'luasnip'
          if ls.choice_active() then
            ls.change_choice(1)
          end
        end,
        mode = { 'i', 's' },
        desc = 'Change choice',
        { silence = true },
      },
    },
  },
  {
    'rafamadriz/friendly-snippets',
    config = function()
      require('luasnip').filetype_extend('typescript', { 'tsdoc' })
      require('luasnip').filetype_extend('javascript', { 'jsdoc' })
      require('luasnip').filetype_extend('lua', { 'luadoc' })
      require('luasnip').filetype_extend('python', { 'pydoc' })
      require('luasnip').filetype_extend('rust', { 'rustdoc' })
      require('luasnip').filetype_extend('cs', { 'csharpdoc' })
      require('luasnip').filetype_extend('java', { 'javadoc' })
      require('luasnip').filetype_extend('c', { 'cdoc' })
      require('luasnip').filetype_extend('cpp', { 'cppdoc' })
      require('luasnip').filetype_extend('php', { 'phpdoc' })
      require('luasnip').filetype_extend('kotlin', { 'kdoc' })
      require('luasnip').filetype_extend('ruby', { 'rdoc' })
      require('luasnip').filetype_extend('sh', { 'shelldoc' })
    end,
  },
}
