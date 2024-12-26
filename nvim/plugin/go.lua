local lsp = require 'language-servers'
local fmt = require 'conform'
local lnt = require 'lint'

-- Language Server
lsp.setup('gopls', {
  filetypes = { 'go', 'gomod' },
  root_dir = require('lspconfig').util.root_pattern('go.mod', '.git'),
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
})

-- Formatter
fmt.formatters_by_ft.go = { 'gofmt' }

-- Linter
lnt.linters_by_ft.go = { 'golangcilint' }
