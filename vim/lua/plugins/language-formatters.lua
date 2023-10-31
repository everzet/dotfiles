-- Language formatters
return {

    {
        "mhartington/formatter.nvim",
        dependencies = {
            -- Formatter Manager (used to install stylua, prettierd, etc.)
            "williamboman/mason.nvim",
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

            -- Format buffers on write
            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                group = vim.api.nvim_create_augroup("FormatOnWrite", {}),
                command = "FormatWrite",
            })
        end,
    },
}
