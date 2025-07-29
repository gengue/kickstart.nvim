-- Close all toggleterm instances on exit
vim.api.nvim_create_autocmd('VimLeavePre', {
  callback = function()
    -- Explicitly close all toggleterm instances before Neovim exits
    vim.cmd 'ToggleTermToggleAll!'
  end,
})

return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    lazy = false,
    keys = {
      { '<c-t>=', '<cmd>ToggleTerm direction=horizontal size=20<cr>', desc = 'Toggle Horizontal Terminal' },
      { '<c-t>|', '<cmd>ToggleTerm direction=float<cr>', desc = 'Toggle Floating Terminal' },
    },
    opts = {
      open_mapping = [[<c-\>]],
      direction = 'float',
      float_ops = {
        border = 'curved',
      },
    },
  },
}
