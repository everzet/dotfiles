-- Navigation-related plugins
return {

  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    config = function(_, _)
      local telescope = require 'telescope'
      telescope.load_extension 'fzf'

      telescope.setup {
        defaults = {
          path_display = { 'smart' },
        },
      }

      -- General file picker
      vim.keymap.set('n', '<C-t>', function()
        require('telescope.builtin').find_files(require('telescope.themes').get_dropdown())
      end, { desc = 'Open File' })

      -- Recent files and buffers
      vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Search Recently Opened Files' })
      vim.keymap.set('n', '<leader>/', function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 20, previewer = false })
      end, { desc = '[/] Search Current Buffer' })

      -- Finders
      vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
      vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch With [G]rep' })
      vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sb', function()
        require('telescope.builtin').buffers { grouped = true, initial_mode = 'normal' }
      end, { desc = '[S]earch Active [B]uffers' })

      -- Lookup files under the neovim config folder
      vim.keymap.set('n', '<leader>sc', function()
        require('telescope.builtin').find_files { cwd = '~/.config', initial_mode = 'normal' }
      end, { desc = '[S]earch My [C]onfig' })
    end,
  },

  -- Filesystem navigation
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function(_, _)
      local oil = require 'oil'

      oil.setup {
        columns = { 'icon' },
        float = { max_width = 80, max_height = 30 },
      }

      vim.keymap.set('n', '-', oil.open, { desc = '[-] Open Parent Directory' })
      vim.keymap.set('n', '<leader>fr', oil.open, { desc = 'Browse [F]iles [R]elative to Current' })

      vim.keymap.set('n', '<leader>fp', function()
        oil.open(vim.fn.getcwd())
      end, { desc = 'Browse [F]iles From [P]roject Root' })
    end,
  },

  -- Nicer jumping between actively worked upon files
  {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function(_, _)
      local mark = require 'harpoon.mark'
      local ui = require 'harpoon.ui'

      vim.keymap.set('n', '<leader>a', mark.add_file, { desc = 'Harpoon current file' })
      vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu, { desc = 'List harpooned files' })

      vim.keymap.set('n', '<C-q>', function()
        ui.nav_file(1)
      end, { desc = 'Open 1st harpooned file' })
      vim.keymap.set('n', '<C-w>', function()
        ui.nav_file(2)
      end, { desc = 'Open 2nd harpooned file' })
    end,
  },
}
