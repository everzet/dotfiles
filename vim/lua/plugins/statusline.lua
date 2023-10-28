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
                    icons_enabled = true,
                    theme = "dracula",
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
                    lualine_x = { "diagnostics", "filetype" },
                    lualine_y = { "searchcount", "require'lsp-status'.status()" },
                    lualine_z = { "location" },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "diagnostics", "filetype" },
                    lualine_y = {},
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
