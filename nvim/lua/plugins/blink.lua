return {
  { -- Autocompleter
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = 'v0.*',
    opts = {
      keymap = { preset = 'default' },

      sources = {
        -- Disable cmdline completions
        cmdline = {},
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },

      completion = {
        documentation = {
          auto_show = true,
          window = { border = 'rounded' },
        },
      },

      signature = { enabled = true },
    },
  },
}
