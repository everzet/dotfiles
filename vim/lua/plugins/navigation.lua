-- Navigation-related plugins
return {

    -- Fuzzy finder
    { 'nvim-telescope/telescope.nvim', version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        config = function(_, _)
            local telescope = require('telescope')
            telescope.load_extension('fzf')
            telescope.load_extension('file_browser')

            telescope.setup({
                pickers = {
                    find_files = { theme = "dropdown" },
                    git_files = { theme = "dropdown" },
                }
            })

            local builtin = require('telescope.builtin')
            local fb = telescope.extensions.file_browser

            vim.keymap.set('n', '<C-t>', builtin.find_files, {})
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>ff',
                function() fb.file_browser({ grouped = true, select_buffer = true, initial_mode = 'normal' }) end, {})
            vim.keymap.set('n', '<leader>fr',
                function() fb.file_browser({ grouped = true, path = '%:p:h', select_buffer = true, initial_mode = 'normal' }) end, {})
            vim.keymap.set('n', '<leader>fb',
                function() builtin.buffers({ grouped = true, initial_mode = 'normal' }) end, {})

            -- Lookup files under the neovim config folder
            vim.keymap.set('n', '<leader>ve',
                function() builtin.find_files({ cwd = '~/.config/nvim', initial_mode = 'normal' }) end, {})
        end
    },

    -- Nicer jumping between actively worked upon files
    { 'ThePrimeagen/harpoon',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function(_, _)
            local mark = require('harpoon.mark')
            local ui = require('harpoon.ui')

            vim.keymap.set('n', '<leader>a', mark.add_file)
            vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

            vim.keymap.set('n', '<C-q>', function() ui.nav_file(1) end)
            vim.keymap.set('n', '<C-w>', function() ui.nav_file(2) end)
        end
    },

}
