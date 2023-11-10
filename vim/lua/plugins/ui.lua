-- UI-related plugins
return {

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function(_, _)
      require('lualine').setup {
        options = {
          theme = 'iceberg_dark',
          icons_enabled = true,
          component_separators = '|',
          section_separators = '',
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff' },
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = { 'diagnostics' },
          lualine_y = { 'filetype' },
          lualine_z = { 'searchcount', 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = { 'diagnostics' },
          lualine_y = { { 'filetype', colored = false, icon_only = true } },
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      }
    end,
  },
}
