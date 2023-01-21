-- UI-related plugins
return {
    -- Icons throughout the UI
    'kyazdani42/nvim-web-devicons',
    -- Git information throughout the UI
    { 'lewis6991/gitsigns.nvim',
        opts = { signcolumn = true },
        config = function(_, opts)
            require('gitsigns').setup(opts)

            -- Fine-tune highlights
            require('colors').inherit_hl('DiffAdd', 'GitSignsAdd', { background = 'none' })
            require('colors').inherit_hl('DiffChange', 'GitSignsChange', { background = 'none' })
            require('colors').inherit_hl('DiffDelete', 'GitSignsDelete', { background = 'none' })
        end
    },
}
