return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Devicons
  use 'kyazdani42/nvim-web-devicons'

  -- Spacing
  use 'editorconfig/editorconfig-vim'

  -- UNIX operations
  use { 'tpope/vim-eunuch',
        config = function() require('plugin-config.eunuch') end }

  -- Exchange two pieces of text
  use 'tommcdo/vim-exchange'

  -- Change quotes and parentheses
  use 'tpope/vim-surround'

  -- Expand vim movement objects to support comma and tag attributes
  use 'austintaylor/vim-commaobject'
  use { 'whatyouhide/vim-textobj-xmlattr',
        requires = {{'kana/vim-textobj-user'}} }

  -- Fuzzy finder for files and buffers
  use { 'nvim-telescope/telescope.nvim',
        requires = {
          {'nvim-lua/popup.nvim'},
          {'nvim-lua/plenary.nvim'},
          {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
          {'nvim-telescope/telescope-file-browser.nvim'},
        },
        config = function() require('plugin-config.telescope') end }

  -- Git visualisation
  use { 'tanvirtin/vgit.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('plugin-config.vgit') end }

  -- Snippets
  use { 'dcampos/nvim-snippy',
        config = function() require('plugin-config.snippy') end }

  -- Autocompletion
  use { 'hrsh7th/nvim-cmp',
        requires = {
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'dcampos/cmp-snippy'},
          {'hrsh7th/cmp-nvim-lua'},
          {'onsails/lspkind-nvim'},
        },
        config = function() require('plugin-config.cmp') end }

  -- Language servers
  use { 'neovim/nvim-lspconfig',
        requires = {{'hrsh7th/cmp-nvim-lsp'}},
        config = function() require('plugin-config.lspconfig') end }

  -- Formatter
  use { 'mhartington/formatter.nvim',
        config = function() require('plugin-config.formatter') end }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require('plugin-config.treesitter') end }
  -- We use this instead of treesitter as treesitter's elixir parser is slow
  use { 'elixir-editors/vim-elixir', ft = {'elixir'} }

  -- There is not Earthly support in Treesitter yet
  use { 'earthly/earthly.vim' }
end)
