local lsp = require 'language-servers'
local fmt = require 'conform'

-- Language Server
lsp.setup('ts_ls', {
  capabilities = {
    documentFormattingProvider = false,
  },
})

-- Formatters
fmt.formatters_by_ft.javascript = { 'prettierd' }
fmt.formatters_by_ft.typescript = { 'prettierd' }
fmt.formatters_by_ft.javascriptreact = { 'prettierd' }
fmt.formatters_by_ft.typescriptreact = { 'prettierd' }
