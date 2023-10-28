-- Statusline plugins
return {

    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-lua/lsp-status.nvim",
        },
        config = function(_, _)
            require("lualine").setup({
                options = {
                    theme = "horizon",
                    icons_enabled = true,
                    section_separators = "",
                    component_separators = "",
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff" },
                    lualine_c = { "filename" },
                    lualine_x = { "filetype" },
                    lualine_y = { "require'lsp-status'.status()" },
                    lualine_z = { "searchcount", "location" },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "filetype" },
                    lualine_y = { "require'lsp-status'.status()" },
                    lualine_z = {},
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {},
            })
        end,
    },
}
