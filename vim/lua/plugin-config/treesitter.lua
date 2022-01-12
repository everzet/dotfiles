require('nvim-treesitter.configs').setup({
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    disable = {
      -- We disable Elixir parser for now as it is very slow
      "elixir"
    },
  },
  indent = {
    enable = true,
    disable = {
      -- We disable Elixir parser for now as it is very slow
      "elixir"
    },
  }
})
