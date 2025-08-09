return {
  -- { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  -- { 'EdenEast/nightfox.nvim' },
  {
    'webhooked/kanso.nvim',
    lazy = false,
    priority = 1000,
    -- opts = {
    --   transparent = true,
    -- },
  },
  {
    'metalelf0/black-metal-theme-neovim',
    lazy = false,
    priority = 1000,
    config = function()
      require('black-metal').setup {}
      require('black-metal').load()
    end,
  },
  -- {
  --   'bjarneo/ash.nvim',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd 'colorscheme ash'
  --   end,
  -- },
  -- {
  --   'bjarneo/snow.nvim',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd 'colorscheme snow'
  --   end,
  -- },
  { 'lunacookies/vim-colors-xcode' },
  {
    'f-person/auto-dark-mode.nvim',
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option_value('background', 'dark', {})
        -- vim.cmd 'colorscheme terafox'
        -- vim.cmd 'colorscheme ash'
        vim.cmd 'colorscheme kanso'
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value('background', 'light', {})
        -- vim.cmd 'colorscheme dawnfox'
        -- vim.cmd 'colorscheme snow'
        vim.cmd 'colorscheme xcodelight'
      end,
    },
  },

  { -- Nice cursor animation effect
    'sphamba/smear-cursor.nvim',
    opts = {},
  },
}
