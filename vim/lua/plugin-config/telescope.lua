require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
local map = vim.api.nvim_set_keymap

map('n', '<c-t>', '<cmd>Telescope find_files<cr>', {noremap = true})
map('n', '<leader>gb', '<cmd>Telescope live_grep<cr>', {noremap = true})
map('n', '<leader>bb', '<cmd>Telescope buffers<cr>', {noremap = true})
map('n', '<leader>fr', "<cmd>Telescope file_browser path=%:p:h<cr>", {noremap = true})
map('n', '<leader>fb', "<cmd>Telescope file_browser<cr>", {noremap = true})

-- Lookup files under the neovim config folder
map('n', '<leader>ve', ':Telescope find_files cwd=~/.config/nvim/<cr>', {noremap = true})
