local map = vim.api.nvim_set_keymap

map('n', '<leader>ha', '<cmd>:lua require("harpoon.mark").add_file()<cr>', {noremap = true})
map('n', '<leader>hs', '<cmd>:lua require("harpoon.ui").toggle_quick_menu()<cr>', {noremap = true})
map('n', '<leader>hp', '<cmd>:lua require("harpoon.ui").nav_prev()<cr>', {noremap = true})
map('n', '<leader>hn', '<cmd>:lua require("harpoon.ui").nav_next()<cr>', {noremap = true})
