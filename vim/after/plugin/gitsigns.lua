require('gitsigns').setup({
    signcolumn = true
})

-- Fine-tune highlights
require('colors').inherit_hl('DiffAdd', 'GitSignsAdd', { background = 'none' })
require('colors').inherit_hl('DiffChange', 'GitSignsChange', { background = 'none' })
require('colors').inherit_hl('DiffDelete', 'GitSignsDelete', { background = 'none' })
