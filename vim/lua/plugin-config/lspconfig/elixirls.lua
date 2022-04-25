return function(capabilities, on_attach)
  require('lspconfig').elixirls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { '/opt/lsp/elixir-ls/language_server.sh' }
  }
end
