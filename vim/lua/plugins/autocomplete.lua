-- Autocompletion
return {

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Core sources
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      -- Snippets
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
    },
    config = function(_, _)
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      require('luasnip.loaders.from_vscode').lazy_load()
      luasnip.config.setup {}

      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-y>'] = cmp.mapping.confirm { select = true },
          ['<C-Space>'] = cmp.mapping.complete(),
        },
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'luasnip' },
        },
      }
    end,
  },
}
