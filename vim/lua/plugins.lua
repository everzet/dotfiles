return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Syntaxes
  use 'leafgarland/typescript-vim'
  use { 'peitalin/vim-jsx-typescript',
        config = function() require('plugin-config.jsx-syntax') end }
  use { 'pangloss/vim-javascript', ft = {'javascript'} }
  use { 'elixir-editors/vim-elixir', ft = {'elixir'} }

  -- Multiple cursors a-la Sublime
  use { 'terryma/vim-multiple-cursors',
        config = function() require('plugin-config.multiple-cursors') end }

  -- Exchange two pieces of text
  use 'tommcdo/vim-exchange'

  -- Change quotes and parentheses
  use 'tpope/vim-surround'

  -- Autoclose parentheses and quotes
  use 'kana/vim-smartinput'

  -- Expand vim movement objects
  use 'austintaylor/vim-commaobject'
  use { 'whatyouhide/vim-textobj-xmlattr',
        requires = {{'kana/vim-textobj-user'}} }

  -- Git UI
  use { 'tpope/vim-fugitive',
        config = function() require('plugin-config.fugitive') end }

  -- Language-dependent spacing
  use 'editorconfig/editorconfig-vim'

  -- File and buffer nav
  use { 'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function() require('plugin-config.telescope') end }
end)
