-- Language linters and notifications
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

      -- Configure diagnostics presentation
      vim.diagnostic.config { virtual_text = true }
      local signs = { Error = ' ', Warn = ' ', Hint = '󰙎 ', Info = ' ' }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
      end

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
