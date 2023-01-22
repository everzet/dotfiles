-- Language servers
return {

    -- LSP megaconfig
    { 'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        },
        config = function(_, _)
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
                        workspace = {
                            library = vim.api.nvim_get_runtime_file('', true),
                            checkThirdParty = false, -- Do not pester us with Lua dependency prompts
                        },
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
                suggest_lsp_servers = true
            })

            -- Set keybinds on LSP attach to the buffer
            lsp.on_attach(function(_, bufnr)
                local defaults = { buffer = bufnr, remap = false }

                -- Go *
                vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, defaults)
                vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, defaults)
                vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations, defaults)
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, defaults)
                vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, defaults)

                -- Navigate diagnostics
                vim.keymap.set('n', 'gl', vim.diagnostic.open_float, defaults)
                vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, defaults)
                vim.keymap.set('n', ']d', vim.diagnostic.goto_next, defaults)

                -- Show * symbols
                vim.keymap.set('n', '<leader>sds', require('telescope.builtin').lsp_document_symbols, defaults)
                vim.keymap.set('n', '<leader>sws', require('telescope.builtin').lsp_dynamic_workspace_symbols, defaults)

                -- Inline help
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, defaults)
                vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, defaults)

                -- Code actions
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, defaults)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, defaults)

                -- Formatting
                vim.keymap.set('n', '<leader>bf', function()
                    if vim.lsp.buf.format then
                        vim.lsp.buf.format()
                    elseif vim.lsp.buf.formatting then
                        vim.lsp.buf.formatting()
                    end
                end, defaults)
            end)

            lsp.setup()

            vim.diagnostic.config({
                virtual_text = true
            })
        end
    },

}
