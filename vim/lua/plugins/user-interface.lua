-- UI-related plugins
return {

    -- Icons throughout the UI
    "nvim-tree/nvim-web-devicons",

    -- Git information throughout the UI
    {
        "lewis6991/gitsigns.nvim",
        opts = { signcolumn = true },
        config = function(_, opts)
            require("gitsigns").setup(opts)

            -- Fine-tune highlights
            require("colors").inherit_hl("DiffAdd", "GitSignsAdd", { background = "none" })
            require("colors").inherit_hl("DiffChange", "GitSignsChange", { background = "none" })
            require("colors").inherit_hl("DiffDelete", "GitSignsDelete", { background = "none" })
        end,
    },

    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-lua/lsp-status.nvim",
        },
        config = function(_, _)
            require("lualine").setup({
                options = {
                    theme = "iceberg_dark",
                    icons_enabled = true,
                    component_separators = "|",
                    section_separators = "",
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
                    lualine_c = { { "filename", path = 1 } },
                    lualine_x = { "filetype" },
                    lualine_y = { "diagnostics", "require'lsp-status'.status()" },
                    lualine_z = { "searchcount", "location" },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { { "filetype", colored = false, icon_only = true } },
                    lualine_y = { "diagnostics" },
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
