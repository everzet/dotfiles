local opt = vim.opt
local cmd = vim.cmd

opt.termguicolors = true

-- Dracula Morbius
cmd 'colorscheme dracula_pro_morbius'
cmd 'highlight Comment guifg=#A97079 gui=italic'
cmd 'highlight LineNr guifg=#584145'

-- Normal Dracula Pro
--cmd 'colorscheme dracula_pro'
--cmd 'highlight Comment guifg=#7970A9 gui=italic'
