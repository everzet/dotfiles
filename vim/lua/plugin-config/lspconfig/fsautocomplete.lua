return function(capabilities, on_attach)
  require('lspconfig').fsautocomplete.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
