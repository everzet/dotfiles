return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Syntaxes
  use 'leafgarland/typescript-vim'
  use { 'peitalin/vim-jsx-typescript',
        config = function() require('plugin-config.jsx-syntax') end }
  use { 'pangloss/vim-javascript', ft = {'javascript'} }
  use { 'elixir-editors/vim-elixir', ft = {'elixir'} }

  -- Spacing
  use 'editorconfig/editorconfig-vim'

  -- UNIX operations
  use { 'tpope/vim-eunuch',
        config = function() require('plugin-config.eunuch') end }

  -- Multiple cursors a-la Sublime
  use { 'terryma/vim-multiple-cursors',
        config = function() require('plugin-config.multiple-cursors') end }

  -- Exchange two pieces of text
  use 'tommcdo/vim-exchange'

  -- Change quotes and parentheses
  use 'tpope/vim-surround'

  -- Expand vim movement objects
  use 'austintaylor/vim-commaobject'
  use { 'whatyouhide/vim-textobj-xmlattr',
        requires = {{'kana/vim-textobj-user'}} }

  -- File and buffer nav
  use { 'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function() require('plugin-config.telescope') end }

  -- Autocompletion and snippets
  use { 'hrsh7th/nvim-cmp',
        requires = {
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'dcampos/nvim-snippy'},
          {'dcampos/cmp-snippy'},
          {'hrsh7th/cmp-nvim-lua'},
          {'onsails/lspkind-nvim'},
        },
        config = function() require('plugin-config.cmp') end }

  -- Language servers
  use { 'neovim/nvim-lspconfig',
        requires = {{'hrsh7th/cmp-nvim-lsp'}},
        config = function() require('plugin-config.lspconfig') end }

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'

  -- Formatter
  use { 'mhartington/formatter.nvim',
        config = function() require('plugin-config.formatter') end }

  -- Git UI
  use { 'tpope/vim-fugitive',
        config = function() require('plugin-config.fugitive') end }
end)
