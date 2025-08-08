return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre', 'BufReadPre', 'BufNewFile' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      -- lsp_format = 'fallback',
    },
    -- Configure formatters to respect project config
    formatters = {
      prettier = {
        -- Use local prettier config if it exists
        condition = function(self, ctx)
          return vim.fs.find(
            { '.prettierrc', '.prettierrc.json', '.prettierrc.yml', '.prettierrc.yaml', '.prettierrc.js', 'prettier.config.js' },
            { path = ctx.filename, upward = true }
          )[1]
        end,
      },
      eslint_d = {
        condition = function(self, ctx)
          return vim.fs.find({ '.eslintrc', '.eslintrc.js', '.eslintrc.json', 'eslint.config.js' }, { path = ctx.filename, upward = true })[1]
        end,
      },
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use 'stop_after_first' to run the first available formatter from the list
      -- Prioritize prettier and eslint_d over biome for better project compatibility
      javascript = {
        'prettier',
        'eslint_d',
        'biome',
        stop_after_first = true,
      },
      javascriptreact = {
        'prettier',
        'eslint_d',
        'biome',
        stop_after_first = true,
      },
      typescript = {
        'prettier',
        'eslint_d',
        'biome',
        stop_after_first = true,
      },
      typescriptreact = {
        'prettier',
        'eslint_d',
        'biome',
        stop_after_first = true,
      },
    },
  },
}
