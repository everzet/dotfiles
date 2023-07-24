-- Language formatters
return {

    { 'mhartington/formatter.nvim',
        config = function(_, _)
            require('formatter').setup({
                filetype = {
                    typescript = {
                        require('formatter.filetypes.javascript').prettier,
                    }
                }
            })
            local defaults = { remap = false }
            vim.keymap.set('n', '<leader>bf', '<cmd>Format<cr>', defaults)
        end
    }

}
