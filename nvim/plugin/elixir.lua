local lsp = require 'language-servers'
local fmt = require 'conform'

-- Language Server
lsp.setup('elixirls', {})

-- Formatter
fmt.formatters_by_ft.elixir = { 'mix' }
