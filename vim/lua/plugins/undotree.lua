return {
  { -- Visual undo for times when we really need to go back
    'mbbill/undotree',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function(_, _)
      vim.keymap.set('n', '<leader>cu', vim.cmd.UndotreeToggle, { desc = '[C]code [U]ndo' })
    end,
  },
}
