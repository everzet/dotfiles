local lsp = require 'language-servers'
local fmt = require 'conform'

-- Language Server
lsp.setup('ts_ls', {
  capabilities = {
    documentFormattingProvider = false,
  },
})

-- Formatters
fmt.formatters_by_ft.javascript = { 'prettier', 'prettierd', stop_after_first = true }
fmt.formatters_by_ft.typescript = { 'prettier', 'prettierd', stop_after_first = true }
fmt.formatters_by_ft.javascriptreact = { 'prettier', 'prettierd', stop_after_first = true }
fmt.formatters_by_ft.typescriptreact = { 'prettier', 'prettierd', stop_after_first = true }
