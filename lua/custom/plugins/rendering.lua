return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    '3rd/image.nvim',
    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    --- TODO: figure out the correct type for this
    ---@module 'image'
    ---@type image.Options
    opts = {
      processor = 'magick_cli',
      integrations = {
        markdown = {
          clear_in_insert_mode = true,
          only_render_image_at_cursor = true,
          only_render_image_at_cursor_mode = 'inline',
        },
      },
    },
  },
}

