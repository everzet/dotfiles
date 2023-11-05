-- Language linters
return {

  {
    'mfussenegger/nvim-lint',
    dependencies = {
      -- Linter Manager (used to install eslint_d, etc.)
      'williamboman/mason.nvim',
    },
    config = function(_, _)
      require('lint').linters_by_ft = {
        typescript = { 'eslint_d' },
        javascript = { 'eslint_d' },
      }

      -- Lint buffers on write
      vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
        group = vim.api.nvim_create_augroup('LintOnWrite', {}),
        callback = function()
          require('lint').try_lint()
        end,
      })
    end,
  },
}
