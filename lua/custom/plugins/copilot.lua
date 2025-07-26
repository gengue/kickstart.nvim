-- plugins/copilot.lua
return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = '<Tab>',
          next = '<M-]>',
          prev = '<M-[>',
          dismiss = '<C-]>',
        },
      },
      panel = { enabled = false },
    },
    config = function(_, opts)
      require('copilot').setup(opts)
    end,
  },
  {
    'onsails/lspkind.nvim',
    optional = true,
    opts = function(_, opts)
      opts.symbol_map = opts.symbol_map or {}
      opts.symbol_map.Copilot = ''
    end,
  },
  {
    'echasnovski/mini.icons',
    optional = true,
    opts = function(_, opts)
      opts.lsp = opts.lsp or {}
      opts.symbol_map = opts.symbol_map or {}
      opts.symbol_map.copilot = { glyph = '', hl = 'MiniIconsAzure' }
    end,
  },
}
