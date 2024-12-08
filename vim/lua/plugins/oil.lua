return {
  { -- Filesystem navigation
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function(_, _)
      local oil = require 'oil'

      oil.setup {
        columns = { 'icon' },
        keymaps = {
          ['<C-h>'] = false,
        },
        view_options = {
          show_hidden = true,
        },
      }

      vim.keymap.set('n', '-', oil.open, { desc = '[-] Open Parent Directory' })
      vim.keymap.set('n', '<leader>fr', oil.open, { desc = 'Browse [F]iles [R]elative to Current' })

      vim.keymap.set('n', '<leader>fp', function()
        oil.open(vim.fn.getcwd())
      end, { desc = 'Browse [F]iles From [P]roject Root' })
    end,
  },
}
