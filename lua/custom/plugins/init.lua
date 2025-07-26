-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'mistweaverco/kulala.nvim',
    ft = { 'http', 'rest' },
    keys = {
      { '<leader>Rs', desc = 'Send request' },
      { '<leader>Ra', desc = 'Send all requests' },
      { '<leader>Rb', desc = 'Open scratchpad' },
    },
    opts = {
      -- your configuration comes here
      global_keymaps = true,
      global_keymaps_prefix = '<leader>R',
      kulala_keymaps_prefix = '',
    },
  },

  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  { 'EdenEast/nightfox.nvim' },
  {
    'projekt0n/github-nvim-theme',
    lazy = true,
  },
  {
    'webhooked/kanso.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('nordic').load()
    end,
  },
  {
    'f-person/auto-dark-mode.nvim',
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option_value('background', 'dark', {})
        -- vim.cmd 'colorscheme kanso'
        vim.cmd 'colorscheme tokyonight-night'
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value('background', 'light', {})
        -- vim.cmd "colorscheme astrolight"
        vim.cmd 'colorscheme github_light'
        -- vim.cmd "colorscheme rose-pine-dawn"
      end,
    },
  },
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
}
