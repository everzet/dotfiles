-- Navigation-related plugins
return {

    -- Fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function(_, _)
            local telescope = require("telescope")
            telescope.load_extension("fzf")

            telescope.setup({
                pickers = {
                    find_files = { theme = "dropdown" },
                    git_files = { theme = "dropdown" },
                },
            })

            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<C-t>", builtin.find_files, { desc = "Search files" })
            vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Search git files" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Search with grep" })
            vim.keymap.set("n", "<leader>fb", function()
                builtin.buffers({ grouped = true, initial_mode = "normal" })
            end, { desc = "List buffers" })

            -- Lookup files under the neovim config folder
            vim.keymap.set("n", "<leader>ve", function()
                builtin.find_files({ cwd = "~/.config", initial_mode = "normal" })
            end, { desc = "List my configs" })
        end,
    },

    -- Filesystem navigation
    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function(_, _)
            local oil = require("oil")

            oil.setup({
                columns = { "icon" },
                float = { max_width = 80, max_height = 30 },
            })

            vim.keymap.set("n", "-", oil.open, { desc = "Open parent directory" })
            vim.keymap.set("n", "<leader>fr", oil.open, { desc = "Open parent directory" })

            vim.keymap.set("n", "<leader>ff", function()
                oil.open(vim.fn.getcwd())
            end, { desc = "Open root directory" })
        end,
    },

    -- Nicer jumping between actively worked upon files
    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function(_, _)
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon current file" })
            vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "List harpooned files" })

            vim.keymap.set("n", "<C-q>", function()
                ui.nav_file(1)
            end, { desc = "Open 1st harpooned file" })
            vim.keymap.set("n", "<C-w>", function()
                ui.nav_file(2)
            end, { desc = "Open 2nd harpooned file" })
        end,
    },
}
