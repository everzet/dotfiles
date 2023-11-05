-- Language syntax related plugins
return {

  -- F# does not have TreeSitter (yet?), so we use normal vim plugin
  { 'kongo2002/fsharp-vim', ft = 'fsharp' },

  -- Earthfile does not have TreeSitter
  { 'earthly/earthly.vim', ft = 'Earthfile' },

  -- TreeSitter
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function(_, _)
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'elixir', 'python', 'html', 'markdown', 'json', 'javascript', 'typescript', 'sql', 'lua', 'vim', 'rust', 'go', 'bash' },
        auto_install = true,

        indent = { enable = true },
        highlight = { enable = true },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
          },
        },

        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']f'] = '@function.outer',
              [']F'] = '@function.inner',
              [']a'] = '@parameter.inner',
            },
            goto_previous_start = {
              ['[f'] = '@function.outer',
              ['[F'] = '@function.inner',
              ['[a'] = '@parameter.inner',
            },
          },
        },
      }
    end,
  },
}
