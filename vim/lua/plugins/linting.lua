-- Language linters and notifications
return {

  {
    {
      'folke/trouble.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
    },
  },

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

      -- Configure diagnostics icons
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
