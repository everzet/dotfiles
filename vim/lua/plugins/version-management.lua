-- Version/history management plugins
return {
    -- Visual undo for times when we really need to go back
    { 'mbbill/undotree',
        config = function(_, _)
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
        end
    },
    -- Git management
    { 'tpope/vim-fugitive',
        config = function(_, _)
            vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { remap = false })
            vim.keymap.set('n', '<leader>ga', vim.cmd.Gwrite, { remap = false })
            vim.keymap.set('n', '<leader>gd', vim.cmd.Gvdiffsplit, { remap = false })
            vim.keymap.set('n', '<leader>gco', vim.cmd.Gread, { remap = false })
            vim.keymap.set('n', '<leader>grn', vim.cmd.GRename, { remap = false })
            vim.keymap.set('n', '<leader>grm', vim.cmd.GDelete, { remap = false })

            local augroup = vim.api.nvim_create_augroup('Everzet_Fugitive', { clear = true })
            vim.api.nvim_create_autocmd('BufWinEnter', {
                group = augroup,
                callback = function()
                    if vim.bo.filetype ~= 'fugitive' then return end

                    local bufnr = vim.api.nvim_get_current_buf()
                    local opts = { buffer = bufnr, remap = false }

                    vim.keymap.set('n', '<leader>gP', function() vim.cmd.Git({ 'pull', '--rebase' }) end, opts)
                    vim.keymap.set('n', '<leader>gp', function() vim.cmd.Git('push') end, opts)
                    vim.keymap.set('n', '<leader>gpn', '<cmd>Git push -u origin ', opts)
                end
            })
        end
    },
}
