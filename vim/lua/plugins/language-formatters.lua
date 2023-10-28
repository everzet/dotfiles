-- Language formatters
return {

    {
        "mhartington/formatter.nvim",
        config = function(_, _)
            require("formatter").setup({
                filetype = {
                    lua = { require("formatter.filetypes.lua").stylua },
                    elixir = { require("formatter.filetypes.elixir").mixformat },
                    typescript = { require("formatter.filetypes.typescript").prettier },
                    javascript = { require("formatter.filetypes.javascript").prettier },
                    json = { require("formatter.filetypes.json").prettier },
                    markdown = { require("formatter.filetypes.markdown").prettier },
                },
            })
            local defaults = { remap = false }
            vim.keymap.set("n", "<leader>bf", "<cmd>Format<cr>", defaults)
        end,
    },
}
