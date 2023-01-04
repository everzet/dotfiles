-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
    -- Package manager
    use 'wbthomason/packer.nvim'

    -- Icons throughout the UI
    use 'kyazdani42/nvim-web-devicons'

    -- Git information throughout the UI
    use 'lewis6991/gitsigns.nvim'

    -- Automatically configure editor based on project settings
    use 'editorconfig/editorconfig-vim'

    -- Nicer jumping between actively worked upon files
    use { 'ThePrimeagen/harpoon',
        requires = { { 'nvim-lua/plenary.nvim' } } }

    -- Visual undo for times when we really need to go back
    use 'mbbill/undotree'

    -- Git management
    use 'tpope/vim-fugitive'

    -- Exchange two blocks of text
    use 'tommcdo/vim-exchange'

    -- Manipulate quotes and parens
    use 'tpope/vim-surround'

    -- Expand vim movement to support comma and tag attributes
    use 'austintaylor/vim-commaobject'
    use { 'whatyouhide/vim-textobj-xmlattr',
        requires = { { 'kana/vim-textobj-user' } } }

    -- Fuzzy finder
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
            { 'nvim-telescope/telescope-file-browser.nvim' },
        }
    }

    -- Language servers
    use { 'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    -- Syntax highlighting with TreeSitter
    use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }
    -- F# does not have TreeSitter (yet?), so we use normal vim plugin
    use 'kongo2002/fsharp-vim'

    -- Running tests
    use 'nordfjord/vim-test'
end)
