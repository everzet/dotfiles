local map = vim.api.nvim_set_keymap

require("harpoon").setup({
  menu = {
    width = math.floor(vim.api.nvim_win_get_width(0) * 0.8),
  }
})

map('n', '<leader>la', '<cmd>:lua require("harpoon.mark").add_file()<cr>', { noremap = true })
map('n', '<leader>ll', '<cmd>:lua require("harpoon.ui").toggle_quick_menu()<cr>', { noremap = true })
map('n', '<leader>lp', '<cmd>:lua require("harpoon.ui").nav_prev()<cr>', { noremap = true })
map('n', '<leader>ln', '<cmd>:lua require("harpoon.ui").nav_next()<cr>', { noremap = true })
