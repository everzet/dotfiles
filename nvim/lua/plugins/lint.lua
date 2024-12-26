return {
  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      -- Disable any default linters
      require('lint').linters_by_ft = {}

      vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
        desc = 'Lint buffer on write',
        group = vim.api.nvim_create_augroup('default-nvim-lint', { clear = true }),
        callback = function()
          require('lint').try_lint()
        end,
      })
    end,
  },
}
