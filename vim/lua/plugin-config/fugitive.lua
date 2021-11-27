local map = vim.api.nvim_set_keymap

map('n', '<leader>gs', ':Git<cr>', {noremap = true})
map('n', '<leader>ga', ':Gwrite<cr>', {noremap = true})
map('n', '<leader>gh', ':Gbrowse!<cr>', {noremap = true})
map('n', '<leader>gc', ':Gcommit --verbose<cr>', {noremap = true})
