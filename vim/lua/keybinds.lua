local defaults = { remap = false }

-- Map <leader> key to comma
vim.g.mapleader = " "

-- Map extra escape sequences
vim.keymap.set('i', 'jk', '<esc>', defaults)
vim.keymap.set('i', '<C-c>', '<esc>', defaults)

-- Remove highlight on leader-space
vim.keymap.set('n', '<leader><space>', '<cmd>nohlsearch<cr>', { remap = false, silent = true })

-- Keep block's selection after (de-)indent
vim.keymap.set('v', 'H', '<gv', defaults)
vim.keymap.set('v', 'L', '>gv', defaults)

-- Vertically move selected block and preserve its indentation
vim.keymap.set('v', 'J', "<cmd>m '>+1<cr>gv=gv", defaults)
vim.keymap.set('v', 'K', "<cmd>m '<-2<cr>gv=gv", defaults)

-- Keep cursor where it is when merging lines with J
vim.keymap.set('n', 'J', 'mzJ`z', defaults)

-- Recenter screen when jumping with C-d and C-u
vim.keymap.set('n', '<C-d>', '<C-d>zz', defaults)
vim.keymap.set('n', '<C-u>', '<C-u>zz', defaults)

-- Recenter screen when jumping between search results
vim.keymap.set('n', 'n', 'nzzzv', defaults)
vim.keymap.set('n', 'N', 'Nzzzv', defaults)

-- Replace selected word without yanking it first
vim.keymap.set('x', '<leader>p', '"_dP', defaults)

-- Delete without yanking it first
vim.keymap.set('n', '<leader>d', '"_d', defaults)
vim.keymap.set('v', '<leader>d', '"_d', defaults)

-- Interact with global paste buffer via <leader> instead of "+ prefix
vim.keymap.set('n', '<leader>y', '"+y', defaults)
vim.keymap.set('v', '<leader>y', '"+y', defaults)
vim.keymap.set('n', '<leader>Y', '"+Y', defaults)
vim.keymap.set('n', '<leader>p', '"+p', defaults)

-- Navigating quickfix lists
vim.keymap.set('n', '[q', '<cmd>cprev<cr>', defaults)
vim.keymap.set('n', ']q', '<cmd>cnext<cr>', defaults)

-- Managing tabs
vim.keymap.set('n', '<leader>df', '<cmd>tab split<cr>', defaults)
vim.keymap.set('n', '<leader>dd', '<cmd>tabclose<cr>', defaults)
vim.keymap.set('n', '<leader>do', '<cmd>tabonly<cr>', defaults)

-- Managing buffers
vim.keymap.set('n', '<leader>bc', '<cmd>bd<cr>', defaults)
vim.keymap.set('n', '<leader>bo', '<cmd>%bd!<cr><C-o><cmd>bd#<cr>zz', defaults)
vim.keymap.set('n', '<leader>bd', '<cmd>%bd!<cr>', defaults)

-- Managing splits
vim.keymap.set('n', '<leader>L', '<C-w>v<C-w>l', defaults)
vim.keymap.set('n', '<leader>J', '<C-w>s<C-w>j', defaults)
vim.keymap.set('n', '<leader>H', '<C-w>v<C-w>h', defaults)
vim.keymap.set('n', '<leader>K', '<C-w>s<C-w>k', defaults)

-- Navigating splits
vim.keymap.set('n', '<C-h>', '<C-w>h', defaults)
vim.keymap.set('n', '<C-j>', '<C-w>j', defaults)
vim.keymap.set('n', '<C-k>', '<C-w>k', defaults)
vim.keymap.set('n', '<C-l>', '<C-w>l', defaults)

-- Resizing splits
vim.keymap.set('n', '˙', '<C-w>5<', defaults)
vim.keymap.set('n', '∆', '<C-w>2+', defaults)
vim.keymap.set('n', '˚', '<C-w>2-', defaults)
vim.keymap.set('n', '¬', '<C-w>5>', defaults)
vim.keymap.set('n', '≠', '<C-w>=', defaults)
