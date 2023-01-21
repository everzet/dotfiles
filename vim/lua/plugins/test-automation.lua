-- Test automation plugins
return {

    -- vim-test fork with F# support
    { 'nordfjord/vim-test',
        config = function(_, _)
            vim.keymap.set('n', '<leader>t', '<cmd>TestNearest<cr>', { remap = false })
            vim.keymap.set('n', '<leader>T', '<cmd>TestFile<cr>', { remap = false })
        end
    },

}
