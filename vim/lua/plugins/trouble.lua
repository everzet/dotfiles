return {
  { -- Diagnostics viewer
    'folke/trouble.nvim',
    opts = {},
    cmd = 'Trouble',
    keys = {
      {
        '<leader>ld',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = '[L]ist [D]iagnostics',
      },
      {
        '<leader>lbd',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = '[L]ist [B]uffer [D]iagnostics',
      },
      {
        '<leader>lqd',
        '<cmd>Trouble loclist toggle<cr>',
        desc = '[L]ist [Q]uickfix [D]iagnostics',
      },
    },
  },
}
