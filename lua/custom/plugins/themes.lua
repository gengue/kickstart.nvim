return {
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  { 'EdenEast/nightfox.nvim' },
  {
    'webhooked/kanso.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    opts = {
      styles = {
        comments = { italic = false }, -- Disable italics in comments
      },
    },
  },
  {
    'tinted-theming/tinted-vim',
  },
  { 'lunacookies/vim-colors-xcode' },
  {
    'f-person/auto-dark-mode.nvim',
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option_value('background', 'dark', {})
        vim.cmd 'colorscheme kanso'
        -- vim.cmd 'colorscheme tokyonight-night'
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value('background', 'light', {})
        -- vim.cmd 'colorscheme dawnfox'
        vim.cmd 'colorscheme xcodelight'
      end,
    },
  },
}
