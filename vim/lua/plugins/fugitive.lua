return {
  { -- Git management
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = '[G]it [S]tatus' })
      vim.keymap.set('n', '<leader>ga', vim.cmd.Gwrite, { desc = '[G]it [A]dd' })
    end,
  },
}
