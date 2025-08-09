-- REPLACED guess-indent.nvim with Snacks indent - see init.lua
-- Keeping indent-blankline as per user preference

return {
  -- -- Detect tabstop and shiftwidth automatically
  -- 'NMAC427/guess-indent.nvim',

  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
}