-- Core plugin ecosystem - Foundation plugins

vim.api.nvim_set_keymap('n', '<leader>e', ':lua MiniFiles.open()<CR>', { noremap = true, silent = true, desc = 'Files explorer' })

return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
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
            { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
            { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
            { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = '⇄', key = 'G', desc = 'Git', action = ':LazyGit' },
            { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
            { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
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
      picker = {
        enabled = true,
        -- Use ripgrep/fd options to respect .gitignore
        sources = {
          files = {
            cmd = 'fd', -- Use fd for file finding (respects .gitignore by default)
            hidden = false,
            follow = false,
            -- fd respects .gitignore by default, these args ensure it
            args = { '--type', 'f', '--color', 'never' },
          },
          grep = {
            cmd = 'rg', -- Use ripgrep (respects .gitignore by default)
            hidden = false,
            -- rg respects .gitignore by default
            args = { '--color', 'never', '--smart-case' },
          },
        },
        formatters = {
          file = {
            filename_first = false, -- Show filepath naturally
          },
        },
      },

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
    config = function(_, opts)
      local Snacks = require 'snacks'
      Snacks.setup(opts)

      -- Picker keymaps (replacing Telescope)
      vim.keymap.set('n', '<leader>sh', function()
        Snacks.picker.help()
      end, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', function()
        Snacks.picker.keymaps()
      end, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', function()
        Snacks.picker.files()
      end, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', function()
        Snacks.picker()
      end, { desc = '[S]earch [S]elect Picker' })
      vim.keymap.set('n', '<leader>sw', function()
        Snacks.picker.grep_word()
      end, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', function()
        Snacks.picker.grep()
      end, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', function()
        Snacks.picker.diagnostics()
      end, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', function()
        Snacks.picker.resume()
      end, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', function()
        Snacks.picker.recent()
      end, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', function()
        Snacks.picker.buffers()
      end, { desc = '[ ] Find existing buffers' })

      -- Media files picker
      vim.keymap.set('n', '<leader>sm', function()
        Snacks.picker.files {
          filter = {
            '*.png',
            '*.webp',
            '*.jpg',
            '*.jpeg',
            '*.gif',
            '*.svg',
          },
        }
      end, { desc = '[S]earch [M]edia Files' })

      -- Current buffer fuzzy find
      vim.keymap.set('n', '<leader>/', function()
        Snacks.picker.lines()
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- Grep in open files
      vim.keymap.set('n', '<leader>s/', function()
        Snacks.picker.grep {
          cwd = vim.fn.getcwd(),
          grep_open_files = true,
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Search Neovim config files
      vim.keymap.set('n', '<leader>sn', function()
        Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      require('mini.icons').setup {
        -- Set to true if you have a Nerd Font
        use_nerd_font = vim.g.have_nerd_font,
      }

      require('mini.files').setup()
      vim.keymap.set('n', '-', function()
        local MiniFiles = require 'mini.files'
        local _ = MiniFiles.close() or MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
        vim.defer_fn(function()
          MiniFiles.reveal_cwd()
        end, 30)
      end, { noremap = true, silent = true, desc = 'Files explorer' })

      -- telescope alternative
      -- require('mini.pick').setup { }

      -- Auto pairs - replaces nvim-autopairs
      require('mini.pairs').setup()

      -- Clue for key hints - replaces which-key
      local miniclue = require 'mini.clue'
      miniclue.setup {
        triggers = {
          -- Leader triggers
          { mode = 'n', keys = '<Leader>' },
          { mode = 'x', keys = '<Leader>' },

          -- Built-in completion
          { mode = 'i', keys = '<C-x>' },

          -- `g` key
          { mode = 'n', keys = 'g' },
          { mode = 'x', keys = 'g' },

          -- Marks
          { mode = 'n', keys = "'" },
          { mode = 'n', keys = '`' },
          { mode = 'x', keys = "'" },
          { mode = 'x', keys = '`' },

          -- Registers
          { mode = 'n', keys = '"' },
          { mode = 'x', keys = '"' },
          { mode = 'i', keys = '<C-r>' },
          { mode = 'c', keys = '<C-r>' },

          -- Window commands
          { mode = 'n', keys = '<C-w>' },

          -- `z` key
          { mode = 'n', keys = 'z' },
          { mode = 'x', keys = 'z' },
        },

        clues = {
          -- Enhance this by adding descriptions for your custom mappings
          { mode = 'n', keys = '<Leader>s', desc = '+[S]earch' },
          { mode = 'n', keys = '<Leader>t', desc = '+[T]oggle' },
          { mode = 'n', keys = '<Leader>h', desc = '+Git [H]unk' },
          { mode = 'v', keys = '<Leader>h', desc = '+Git [H]unk' },
          { mode = 'n', keys = '<Leader>l', desc = '+[L]SP' },
          { mode = 'n', keys = '<Leader>R', desc = '+[R]equests' },

          -- Include mini.clue's built-in clues
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
        },

        window = {
          delay = 600,
          config = {
            width = 'auto',
          },
        },
      }

      -- Highlight patterns - replaces todo-comments.nvim and nvim-highlight-colors
      require('mini.hipatterns').setup {
        highlighters = {
          -- TODO/FIXME/HACK/NOTE/PERF/WARNING highlighting
          fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
          hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
          todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
          note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
          perf = { pattern = '%f[%w]()PERF()%f[%W]', group = 'MiniHipatternsNote' },
          warning = { pattern = '%f[%w]()WARNING()%f[%W]', group = 'MiniHipatternsFixme' },

          -- Hex color highlighting (#rrggbb)
          hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
        },
      }
    end,
  },

  -- { 'mg979/vim-visual-multi' }, -- Multi-cursor support
}
