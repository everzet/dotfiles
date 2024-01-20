-- Map <leader> key to comma
vim.g.mapleader = ' '

-- Map extra escape sequences
vim.keymap.set('i', 'jk', '<esc>', { noremap = true, desc = 'Exit insert mode' })
vim.keymap.set('i', '<C-c>', '<esc>', { desc = 'Exit insert mode' })

-- Remove highlight on leader-space
vim.keymap.set('n', '<leader><space>', '<cmd>nohlsearch<cr>', { silent = true, desc = 'Dehighlight search' })

-- Keep block's selection after (de-)indent
vim.keymap.set('v', '<', '<gv', { noremap = true, desc = 'Deindent without losing selection' })
vim.keymap.set('v', '>', '>gv', { noremap = true, desc = 'Indent without losing selection' })

-- Vertically move selected block and preserve its indentation
vim.keymap.set('v', 'J', ":m '>+1<cr>gv=gv", { noremap = true, desc = 'Move down preserving indentation' })
vim.keymap.set('v', 'K', ":m '<-2<cr>gv=gv", { noremap = true, desc = 'Move up preserving indentation' })

-- Keep cursor where it is when merging lines with J
vim.keymap.set('n', 'J', 'mzJ`z', { noremap = true, desc = 'Merge lines preserving cursor position' })

-- Recenter screen when jumping with C-d and C-u
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, desc = 'Move down and recenter screen' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, desc = 'Move up and recenter screen' })

-- Recenter screen when jumping between search results
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true, desc = 'Move to next search result and recenter screen' })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true, desc = 'Move to previous search result and recenter screen' })

-- Replace selected text without yanking it first
vim.keymap.set('x', '<leader>p', '"_dP', { noremap = true, desc = 'Replace selected text without yanking it' })

-- Delete without yanking it first
vim.keymap.set('n', '<leader>d', '"_d', { noremap = true, desc = 'Delete without yanking' })
vim.keymap.set('v', '<leader>d', '"_d', { noremap = true, desc = 'Delete without yanking' })

-- Interact with global paste buffer via <leader> instead of "+ prefix
vim.keymap.set('n', '<leader>y', '"+y', { noremap = true, desc = 'Yank to global buffer' })
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, desc = 'Yank to global buffer' })
vim.keymap.set('n', '<leader>p', '"+p', { noremap = true, desc = 'Paste from global buffer' })

-- Navigating quickfix lists
vim.keymap.set('n', '<leader>oq', '<cmd>copen<cr>', { desc = '[O]pen [Q]uickfix' })
vim.keymap.set('n', '<leader>cq', '<cmd>cclose<cr>', { desc = '[C]lose [Q]uickfix ' })
vim.keymap.set('n', '[q', '<cmd>cprev<cr>', { desc = 'Previous [Q]uickfix' })
vim.keymap.set('n', ']q', '<cmd>cnext<cr>', { desc = 'Next [Q]uickfix' })

-- Managing tabs
vim.keymap.set('n', '<leader>df', '<cmd>tab split<cr>', { desc = 'Open new tab' })
vim.keymap.set('n', '<leader>dd', '<cmd>tabclose<cr>', { desc = 'Close current tab' })
vim.keymap.set('n', '<leader>do', '<cmd>tabonly<cr>', { desc = 'Close other tabs' })

-- Managing buffers
vim.keymap.set('n', '<leader>bc', '<cmd>bd<cr>', { noremap = true, desc = 'Close buffer' })
vim.keymap.set('n', '<leader>bo', '<cmd>%bd!<cr><C-o><cmd>bd#<cr>zz', { noremap = true, desc = 'Close other buffers' })
vim.keymap.set('n', '<leader>bd', '<cmd>%bd!<cr>', { noremap = true, desc = 'Close all buffers' })

-- Managing splits
vim.keymap.set('n', '<leader>L', '<C-w>v<C-w>l', { desc = 'Split right' })
vim.keymap.set('n', '<leader>J', '<C-w>s<C-w>j', { desc = 'Split down' })
vim.keymap.set('n', '<leader>H', '<C-w>v<C-w>h', { desc = 'Split left' })
vim.keymap.set('n', '<leader>K', '<C-w>s<C-w>k', { desc = 'Split up' })

-- Resizing splits
vim.keymap.set('n', '≠', '<C-w>=', { desc = 'Equalize all split sizes' })
