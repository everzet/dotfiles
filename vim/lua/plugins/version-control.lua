-- Version/history management plugins
return {

    -- Visual undo for times when we really need to go back
    {
        "mbbill/undotree",
        config = function(_, _)
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Browse undo history" })
        end,
    },

    -- Git management
    {
        "tpope/vim-fugitive",
        config = function(_, _)
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
            vim.keymap.set("n", "<leader>ga", vim.cmd.Gwrite, { desc = "Stage current file" })
            vim.keymap.set("n", "<leader>gd", vim.cmd.Gvdiffsplit, { desc = "Git diff current file" })
            vim.keymap.set("n", "<leader>gco", vim.cmd.Gread, { desc = "Git checkout current file" })
            vim.keymap.set("n", "<leader>grn", vim.cmd.GRename, { desc = "Git rename current file" })
            vim.keymap.set("n", "<leader>grm", vim.cmd.GDelete, { desc = "Git delete current file" })

            local augroup = vim.api.nvim_create_augroup("Everzet_Fugitive", { clear = true })
            vim.api.nvim_create_autocmd("BufWinEnter", {
                group = augroup,
                callback = function()
                    if vim.bo.filetype ~= "fugitive" then
                        return
                    end

                    local bufnr = vim.api.nvim_get_current_buf()

                    vim.keymap.set("n", "gP", function()
                        vim.cmd.Git({ "pull", "--rebase" })
                    end, { buffer = bufnr, desc = "Git pull with rebase" })
                    vim.keymap.set("n", "gp", function()
                        vim.cmd.Git("push")
                    end, { buffer = bufnr, desc = "Git push" })
                end,
            })
        end,
    },
}
