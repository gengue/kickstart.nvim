local Terminal = require('toggleterm.terminal').Terminal
local lazysql = Terminal:new {
  cmd = 'lazysql',
  hidden = true,
  border = 'curved',
  direction = 'float',
  float_opts = {
    border = 'curved',
    width = function()
      return math.floor(vim.o.columns * 0.95)
    end,
    height = function()
      return math.floor(vim.o.lines * 0.95)
    end,
  },
}

function _lazysql_toggle()
  lazysql:toggle()
end

vim.api.nvim_set_keymap('n', '<leader>sql', '<cmd>lua _lazysql_toggle()<CR>', { noremap = true, silent = true })

vim.api.nvim_create_user_command('LazySQL', function()
  _lazysql_toggle()
end, { desc = 'Toggle Lazysql' })
