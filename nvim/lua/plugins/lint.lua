return {
  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local augroup = vim.api.nvim_create_augroup('default-nvim-lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = augroup,
        callback = function()
          require('lint').try_lint()
        end,
      })
    end,
  },
}
