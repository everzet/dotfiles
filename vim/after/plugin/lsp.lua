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

-- Configure Lua LSP to support vim configs
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = { globals = { 'vim' } },
            workspace = { library = vim.api.nvim_get_runtime_file('', true) },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = { enable = false },
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
lsp.set_preferences({
    suggest_lsp_servers = false
})

-- Set keybinds on LSP attach to the buffer
lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    -- Go *
    vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, opts)
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
    vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)

    -- Navigate diagnostics
    vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

    -- Show * symbols
    vim.keymap.set('n', '<leader>sds', require('telescope.builtin').lsp_document_symbols, opts)
    vim.keymap.set('n', '<leader>sws', require('telescope.builtin').lsp_dynamic_workspace_symbols, opts)

    -- Inline help
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)

    -- Code actions
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

    -- Formatting
    vim.keymap.set('n', '<leader>f', function()
        if vim.lsp.buf.format then
            vim.lsp.buf.format()
        elseif vim.lsp.buf.formatting then
            vim.lsp.buf.formatting()
        end
    end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
