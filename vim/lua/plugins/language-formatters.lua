-- Language formatters
return {
    {
        "mhartington/formatter.nvim",
        dependencies = {
            -- Package Manager
            { "williamboman/mason.nvim" },
        },
        config = function(_, _)
            require("formatter").setup({
                filetype = {
                    lua = { require("formatter.filetypes.lua").stylua },
                    elixir = { require("formatter.filetypes.elixir").mixformat },
                    typescript = { require("formatter.filetypes.typescript").prettierd },
                    javascript = { require("formatter.filetypes.javascript").prettierd },
                    json = { require("formatter.filetypes.json").prettierd },
                    markdown = { require("formatter.filetypes.markdown").prettierd },
                },
            })
            local defaults = { remap = false }
            vim.keymap.set("n", "<leader>bf", "<cmd>Format<cr>", defaults)
        end,
    },
}
