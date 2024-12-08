return {
  { -- Git management
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = '[G]it [S]tatus' })
      vim.keymap.set('n', '<leader>ga', vim.cmd.Gwrite, { desc = '[G]it [A]dd' })
    end,
  },

  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'

      lint.linters_by_ft = {
        go = { 'golangcilint' },
      }

      local augroup = vim.api.nvim_create_augroup('kickstart-nvim-lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = augroup,
        callback = function()
          require('lint').try_lint()
        end,
      })
    end,
  },
}
