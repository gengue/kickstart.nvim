return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    keys = {
      {
        '<c-\\>',
        function()
          Snacks.terminal.toggle(nil, { win = { position = 'float' } })
        end,
        mode = { 'n', 't' },
        desc = 'Toggle Terminal',
      },
      {
        '<c-t>=',
        function()
          Snacks.terminal.toggle(nil, { win = { position = 'bottom', height = 20 } })
        end,
        mode = { 'n', 't' },
        desc = 'Toggle Horizontal Terminal',
      },
      {
        '<c-t>|',
        function()
          Snacks.terminal.toggle(nil, { win = { position = 'float' } })
        end,
        mode = { 'n', 't' },
        desc = 'Toggle Floating Terminal',
      },
      {
        '<leader>gg',
        function()
          Snacks.lazygit()
        end,
        desc = 'LazyGit',
      },
    },
    opts = {
      dashboard = {
        enabled = true,
        preset = {
          header = [[

 ██████╗ ███████╗███╗   ██╗███████╗███████╗██╗███████╗
██╔════╝ ██╔════╝████╗  ██║██╔════╝██╔════╝██║██╔════╝
██║  ███╗█████╗  ██╔██╗ ██║█████╗  ███████╗██║███████╗
██║   ██║██╔══╝  ██║╚██╗██║██╔══╝  ╚════██║██║╚════██║
╚██████╔╝███████╗██║ ╚████║███████╗███████║██║███████║
 ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝╚══════╝╚═╝╚══════╝
]],
          keys = {
            { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
            { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
            { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = '⇄', key = 'G', desc = 'Git', action = ':LazyGit' },
            { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
            { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
          },
        },
      },

      bigfile = {
        enabled = true,
        notify = false, -- show notification when big file detected
        size = 1.5 * 1024 * 1024, -- 1.5MB
        line_length = 1000, -- average line length (useful for minified files)
      },

      input = { enabled = true },

      -- telescope alternative
      -- picker = { enabled = true },

      -- toast notifications (also shows LSP progress, replaces fidget.nvim)
      notifier = { 
        enabled = true,
        timeout = 3000,
      },

      -- When doing nvim somefile.txt, it will render the file as quickly as possible, before loading your plugins.
      quickfile = { enabled = true },

      -- Auto-show LSP references and quickly navigate between them
      words = { enabled = true },

      -- Terminal - replaces toggleterm.nvim
      terminal = {
        enabled = true,
        win = {
          position = 'float',
          border = 'rounded',
        },
      },

      -- LazyGit integration - replaces lazygit.nvim
      lazygit = { 
        enabled = true,
        -- Fix for dimmed buffer after closing
        win = {
          backdrop = false, -- Disable the dimmed backdrop
        },
      },

      -- Auto-detect indentation - replaces guess-indent.nvim
      indent = { 
        enabled = true,
        priority = 1, -- Run early
      },
    },
  },
  { 'mg979/vim-visual-multi' },
  {
    -- nice animation in cursor movement
    'sphamba/smear-cursor.nvim',
    opts = {},
  },
}
