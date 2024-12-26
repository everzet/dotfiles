return {
  { -- Autocompleter
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = 'v0.*',
    opts = {
      keymap = {
        preset = 'default',
        ['<C-n>'] = { 'show', 'select_next', 'fallback' },
        ['<C-v>'] = { 'snippet_forward', 'fallback' },
        ['<C-c>'] = { 'snippet_backward', 'fallback' },
        ['<Tab>'] = {},
        ['<S-Tab>'] = {},
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },

      completion = {
        menu = {
          auto_show = function(ctx)
            -- Do not ato-show autocompletion in cmdline
            return ctx.mode ~= 'cmdline'
          end,
        },
        documentation = {
          auto_show = true,
          window = { border = 'rounded' },
        },
      },

      signature = {
        enabled = true,
        window = { border = 'rounded' },
      },
    },
  },
}
