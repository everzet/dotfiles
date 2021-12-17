require('nvim-treesitter.configs').setup({
  ensure_installed = "maintained",
  sync_install = false,
  -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,
    disable = { "elixir" },
    additional_vim_regex_highlighting = false,
  },
})
