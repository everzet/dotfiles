local opts = { remap = false }

-- Map <leader> key to comma
vim.g.mapleader = ","

-- Map extra escape sequences
vim.keymap.set('i', 'jk', '<esc>', opts)
vim.keymap.set('i', '<C-c>', '<esc>', opts)

-- Remove highlight on leader-space
vim.keymap.set('n', '<leader><space>', ':nohlsearch<cr>', { remap = false, silent = true })

-- Keep block's selection after (de-)indent
vim.keymap.set('v', 'H', '<gv', opts)
vim.keymap.set('v', 'L', '>gv', opts)

-- Vertically move selected block and preserve its indentation
vim.keymap.set('v', 'J', ":m '>+1<cr>gv=gv", opts)
vim.keymap.set('v', 'K', ":m '<-2<cr>gv=gv", opts)

-- Keep cursor where it is when merging lines with J
vim.keymap.set('n', 'J', 'mzJ`z', opts)

-- Recenter screen when jumping with C-d and C-u
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Recenter screen when jumping between search results
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Replace selected word without yanking it first
vim.keymap.set('x', '<leader>p', '"_dP', opts)

-- Delete without yanking it first
vim.keymap.set('n', '<leader>d', '"_d', opts)
vim.keymap.set('v', '<leader>d', '"_d', opts)

-- Interact with global paste buffer via <leader> instead of "+ prefix
vim.keymap.set('n', '<leader>y', '"+y', opts)
vim.keymap.set('v', '<leader>y', '"+y', opts)
vim.keymap.set('n', '<leader>Y', '"+Y', opts)
vim.keymap.set('n', '<leader>p', '"+p', opts)

-- Managing tabs
vim.keymap.set('n', '<leader>df', ':tab split<cr>', opts)
vim.keymap.set('n', '<leader>dd', ':tabclose<cr>', opts)
vim.keymap.set('n', '<leader>do', ':tabonly<cr>', opts)

-- Managing buffers
vim.keymap.set('n', '<leader>bc', ':bd<cr>', opts)
vim.keymap.set('n', '<leader>bo', ':%bd<cr><C-o>:bd#<cr>', opts)
vim.keymap.set('n', '<leader>bd', ':bufdo bd<cr>', opts)

-- Managing splits
vim.keymap.set('n', '<leader>we', '<C-w>v<C-w>l', opts)
vim.keymap.set('n', '<leader>ws', '<C-w>s<C-w>j', opts)
vim.keymap.set('n', '<leader>wq', '<C-w>v<C-w>h', opts)
vim.keymap.set('n', '<leader>w2', '<C-w>s<C-w>k', opts)

-- Resizing splits
vim.keymap.set('n', '<leader>w=', '<C-w>=', opts)
vim.keymap.set('n', '<leader>w0', '<C-w>|', opts)

-- Navigating splits
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)
