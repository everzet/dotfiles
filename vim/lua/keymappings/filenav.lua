local map = vim.api.nvim_set_keymap

-- Use full path under gf
map('n', 'gf', ':edit <cfile><cr>', {noremap = true})

-- Bespoke mnemonics for folder/file edits
map('n', '<leader>ep', ':e <c-r>=fnamemodify(expand("%:p:h"), ":~:.")."/"<cr>', {noremap = true})
map('n', '<leader>es', ':vsp <c-r>=fnamemodify(expand("%:p:h"), ":~:.")."/"<cr>', {noremap = true})
map('n', '<leader>mk', ':!mkdir <c-r>=fnamemodify(expand("%:p:h"), ":~:.")."/"<cr>', {noremap = true})
map('n', '<leader>rm', ':!rm -rf <c-r>=fnamemodify(expand("%:p:h"), ":~:.")."/"<cr>', {noremap = true})
