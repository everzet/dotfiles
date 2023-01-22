-- Wiki plugins
return {

    -- zk
    { 'mickael-menu/zk-nvim',
        opts = {
            picker = 'telescope',
            lsp = {
                config = {
                    cmd = { 'zk', 'lsp' },
                    name = 'zk',
                },

                -- automatically attach buffers in a zk notebook that match the given filetypes
                auto_attach = {
                    enabled = true,
                    filetypes = { 'markdown' },
                },
            }
        },
        config = function(_, opts)
            require('zk').setup(opts)

            local defaults = { noremap = true, silent = false }
            vim.api.nvim_set_keymap("n", "<leader>ww", "<cmd>ZkNotes { sort = { 'modified' } }<cr>", defaults)
            vim.api.nvim_set_keymap("n", "<leader>wt", "<cmd>ZkTags<cr>", defaults)
            vim.api.nvim_set_keymap("n", "<leader>wn", "<cmd>ZkNew { title = vim.fn.input('Title: ') }<cr>", defaults)
            vim.api.nvim_set_keymap("v", "<leader>wn", "<cmd>'<,'>ZkNewFromTitleSelection<cr>", defaults)
        end
    }

}
