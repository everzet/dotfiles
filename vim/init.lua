-- [[ General Settings ]]
-- See `:help vim.opt`

-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'nosplit'

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Map extra escape sequences
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit insert mode' })
vim.keymap.set('i', '<C-c>', '<Esc>', { desc = 'Exit insert mode' })

-- Horizontally move selected block, while keeping selection
vim.keymap.set('v', 'H', '<gv', { desc = 'Deindent without losing selection' })
vim.keymap.set('v', 'L', '>gv', { desc = 'Indent without losing selection' })

-- Vertically move selected block and preserve its indentation
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move down preserving indentation' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move up preserving indentation' })

-- Keep cursor where it is when merging lines with J
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Merge lines preserving cursor position' })

-- Recenter screen when jumping with C-d and C-u
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Move down and recenter screen' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Move up and recenter screen' })

-- Recenter screen when jumping between search results
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Move to next search result and recenter screen' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Move to previous search result and recenter screen' })

-- Replace selected text without yanking it first
vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Replace selected text without yanking it' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })

-- Navigating quickfix lists
vim.keymap.set('n', '<leader>[q', '<cmd>cprev<CR>', { desc = '[Previous [Q]uickfix' })
vim.keymap.set('n', '<leader>]q', '<cmd>cnext<CR>', { desc = ']Next [Q]uickfix' })

-- Navigating windows
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move window down' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move window left' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move window up' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move window right' })

-- Managing tabs
vim.keymap.set('n', '<leader>tn', '<cmd>tab split<CR>', { desc = '[T]ab [N]ew' })
vim.keymap.set('n', '<leader>to', '<cmd>tabonly<CR>', { desc = '[T]ab [O]nly' })
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = '[T]ab [X]ill' })

-- Managing buffers
vim.keymap.set('n', '<leader>bo', '<cmd>%bd!<CR><C-o><cmd>bd#<CR>zz', { desc = '[B]uffer [O]nly' })
vim.keymap.set('n', '<leader>bx', '<cmd>bd<CR>', { desc = '[B]uffer [X]ill' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure Diagnostic ]]
--
vim.diagnostic.config {
  virtual_text = true,
  float = { border = 'rounded' },
}

-- Use icons as diagnostic signs
vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError', linehl = '', numhl = '' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '󰀦', texthl = 'DiagnosticSignWarn', linehl = '', numhl = '' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo', linehl = '', numhl = '' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint', linehl = '', numhl = '' })

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins, you can run
--    :Lazy update
--
require('lazy').setup {
  { import = 'plugins' },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
