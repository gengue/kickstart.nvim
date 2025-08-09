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
  { 'lunacookies/vim-colors-xcode' },
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
  {
    'f-person/auto-dark-mode.nvim',
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option_value('background', 'dark', {})
        vim.cmd 'colorscheme kanso'
        -- vim.cmd 'colorscheme ash'
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value('background', 'light', {})
        -- vim.cmd 'colorscheme dawnfox'
        -- vim.cmd 'colorscheme snow'
        vim.cmd 'colorscheme xcodelight'
      end,
    },
  },
}
