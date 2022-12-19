local telescope = require('telescope')
telescope.load_extension('fzf')
telescope.load_extension('file_browser')

local builtin = require('telescope.builtin')
local fb = telescope.extensions.file_browser

vim.keymap.set('n', '<C-t>', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ff',
    function() fb.file_browser({ select_buffer = true, initial_mode = 'normal' }) end, {})
vim.keymap.set('n', '<leader>fr',
    function() fb.file_browser({ path = '%:p:h', select_buffer = true, initial_mode = 'normal' }) end, {})
vim.keymap.set('n', '<leader>fb',
    function() builtin.buffers({ initial_mode = 'normal' }) end, {})

-- Lookup files under the neovim config folder
vim.keymap.set('n', '<leader>ve',
    function() builtin.find_files({ cwd = '~/.config/nvim', initial_mode = 'normal' }) end, {})
