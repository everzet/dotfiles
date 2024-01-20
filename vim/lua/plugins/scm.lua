-- Version/history management plugins
return {

  -- Visual undo for times when we really need to go back
  {
    'mbbill/undotree',
    config = function(_, _)
      vim.keymap.set('n', '<leader>uh', vim.cmd.UndotreeToggle, { desc = '[U]ndo [H]istory' })
    end,
  },

  -- Git information throughout the UI
  {
    'lewis6991/gitsigns.nvim',
    config = function(_, _)
      require('gitsigns').setup {
        signcolumn = true,
        on_attach = function(bufnr)
          vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review Git [H]unk' })
        end,
      }

      -- Fine-tune highlights
      require('colors').inherit_hl('DiffAdd', 'GitSignsAdd', { background = 'none' })
      require('colors').inherit_hl('DiffChange', 'GitSignsChange', { background = 'none' })
      require('colors').inherit_hl('DiffDelete', 'GitSignsDelete', { background = 'none' })
    end,
  },

  -- Git management
  {
    'tpope/vim-fugitive',
    dependencies = {
      'tpope/vim-rhubarb',
    },
    config = function(_, _)
      vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = '[G]it [S]tatus' })
      vim.keymap.set('n', '<leader>ga', vim.cmd.Gwrite, { desc = '[G]it [A]dd Current File' })
      vim.keymap.set('n', '<leader>gd', vim.cmd.Gvdiffsplit, { desc = '[G]it [D]iff Current File' })
      vim.keymap.set('n', '<leader>gco', vim.cmd.Gread, { desc = '[G]it [C]heck[o]ut Current File' })
      vim.keymap.set('n', '<leader>grn', vim.cmd.GRename, { desc = '[G]it [R]e[n]ame Current File' })
      vim.keymap.set('n', '<leader>grm', vim.cmd.GDelete, { desc = '[G]it [R]e[m]ove Current File' })

      vim.keymap.set('n', '<leader>gpr', function()
        vim.cmd.Git { 'pull', '--rebase' }
      end, { desc = '[G]it [P]ull With [R]ebase' })
      vim.keymap.set('n', '<leader>gp', function()
        vim.cmd.Git 'push'
      end, { desc = '[G]it [P]ush' })
    end,
  },
}
