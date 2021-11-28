require('telescope').load_extension('fzf')
local map = vim.api.nvim_set_keymap

map('n', '<c-t>', ':Telescope find_files<cr>', {noremap = true})
map('n', '<c-f>', ':Telescope live_grep<cr>', {noremap = true})
map('n', '<c-b>', ':Telescope buffers<cr>', {noremap = true})
