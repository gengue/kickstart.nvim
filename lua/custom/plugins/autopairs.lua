-- autocompletion pairs and tags
-- REPLACED BY mini.pairs - see mini.lua

return {
  -- {
  --   'windwp/nvim-autopairs',
  --   event = 'InsertEnter',
  --   opts = {},
  -- },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {}
    end,
  },
}