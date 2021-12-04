require('telescope').load_extension('fzf')
local map = vim.api.nvim_set_keymap

map('n', '<c-t>', ':Telescope find_files<cr>', {noremap = true})
map('n', '<c-f>', ':Telescope file_browser<cr>', {noremap = true})
map('n', '<c-g>', ':Telescope live_grep<cr>', {noremap = true})
map('n', '<c-b>', ':Telescope buffers<cr>', {noremap = true})
map('n', '<leader>ve', ':Telescope find_files cwd=~/.config/nvim/<cr>', {noremap = true})
