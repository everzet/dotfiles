-- Test automation plugins
return {

    -- vim-test fork with F# support
    { 'nordfjord/vim-test',
        config = function(_, _)
            local defaults = { remap = true }
            vim.keymap.set('n', '<leader>t', '<cmd>TestNearest<cr>', defaults)
            vim.keymap.set('n', '<leader>T', '<cmd>TestFile<cr>', defaults)
        end
    },

}
