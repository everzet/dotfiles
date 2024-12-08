return {
  { -- Diagnostics viewer
    'folke/trouble.nvim',
    keys = {
      {
        '<leader>wd',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = '[W]orkspace [D]iagnostics',
      },
    },
    opts = {},
  },
}
