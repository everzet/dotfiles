local map = vim.api.nvim_set_keymap

vim.g.mapleader = ','
map('i', 'jk', '<esc>', {noremap = true})
map('n', '<leader> ', ':nohlsearch<cr>', {noremap = true, silent = true})

-- Keep visual selection after move
map('v', '<', '<gv', {noremap = true})
map('v', '>', '>gv', {noremap = true})

-- Better search defaults
map('n', '/', '/\\v', {noremap = true})
map('v', '/', '/\\v', {noremap = true})

require('keymappings.tabs')
require('keymappings.splits')
require('keymappings.buffers')
require('keymappings.filenav')