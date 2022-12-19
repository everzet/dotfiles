local lsp = require('lsp-zero')
local cmp = require('cmp')

-- Use recommended preset
lsp.preset('recommended')

-- Always install following servers
lsp.ensure_installed({
    'elixirls',
    'tsserver',
    'eslint',
    'sumneko_lua',
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

-- Setup completion keybinds
local cmp_select = { behavior = cmp.SelectBehavior.Select }
lsp.setup_nvim_cmp({
    mapping = lsp.defaults.cmp_mappings({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    })
})

-- Override default preferences
lsp.set_preferences({})

-- Set keybinds on LSP attach to the buffer
lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>lws', function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', '<leader>sd', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format() end, opts)
    vim.keymap.set('n', '<leader>lca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>lrr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>lrn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()
