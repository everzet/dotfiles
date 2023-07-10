return {
    {
        'sbdchd/neoformat',
        config = function(_, _)
            local defaults = { remap = false }
            vim.keymap.set('n', '<leader>bf', '<cmd>Neoformat<cr>', defaults)
        end
    }
}
