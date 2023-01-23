-- Wiki plugins
return {

    -- zk
    { 'mickael-menu/zk-nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        opts = {
            picker = 'telescope',
            lsp = {
                config = {
                    cmd = { 'zk', 'lsp' },
                    name = 'zk',
                    on_attach = function(_, bufnr)
                        local defaults = { buffer = bufnr, remap = false }
                        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, defaults)
                        vim.keymap.set('n', 'gl', vim.diagnostic.open_float, defaults)
                        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, defaults)
                        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, defaults)
                        vim.keymap.set('n', 'K', vim.lsp.buf.hover, defaults)
                    end
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
            vim.api.nvim_set_keymap('n', '<leader>ww', '<cmd>ZkNotes { sort = { "modified" } }<cr>', defaults)
            vim.api.nvim_set_keymap('n', '<leader>wt', '<cmd>ZkTags<cr>', defaults)
            vim.api.nvim_set_keymap('n', '<leader>wn', '<cmd>ZkNew { title = vim.fn.input("Title: ") }<cr>', defaults)
            vim.api.nvim_set_keymap('v', '<leader>wn', ':ZkNewFromTitleSelection<cr>', defaults)
        end
    }

}
