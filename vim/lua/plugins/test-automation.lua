-- Test automation plugins
return {

    -- vim-test fork with F# support
    {
        "nordfjord/vim-test",
        config = function(_, _)
            vim.keymap.set("n", "<leader>t", "<cmd>TestNearest<cr>", { desc = "Run nearest test" })
            vim.keymap.set("n", "<leader>T", "<cmd>TestFile<cr>", { desc = "Run whole test file" })
        end,
    },
}
