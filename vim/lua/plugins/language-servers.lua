-- Language servers
return {
    -- LSP megaconfig
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Package Manager
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-nvim-lsp" },
            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "saadparwaiz1/cmp_luasnip" },
            { "rafamadriz/friendly-snippets" },
        },
        config = function(_, _)
            -- Setup LSP management UI (Mason)
            require("mason").setup()
            require("mason-lspconfig").setup({
                -- Always install following servers
                ensure_installed = {
                    "elixirls",
                    "tsserver",
                    "lua_ls",
                },
            })

            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Configure LSPs
            lspconfig.elixirls.setup({ capabilities = capabilities })
            lspconfig.tsserver.setup({ capabilities = capabilities })

            -- Configure Lua LSP to support vim configs
            local runtime_path = vim.split(package.path, ";")
            table.insert(runtime_path, "lua/?.lua")
            table.insert(runtime_path, "lua/?/init.lua")
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using (most likely LuaJIT)
                            version = "LuaJIT",
                            -- Setup your lua path
                            path = runtime_path,
                        },
                        diagnostics = { globals = { "vim" } },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false, -- Do not pester us with Lua dependency prompts
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = { enable = false },
                    },
                },
            })

            -- Setup completion keybinds
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }),
                {
                    { name = "buffer" },
                },
            })

            -- Set keybinds on LSP attach to the buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("HookLspKeybinds", {}),
                callback = function(ev)
                    local defaults = { buffer = ev.buf, remap = false }

                    -- Go *
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, defaults)
                    vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, defaults)
                    vim.keymap.set("n", "go", require("telescope.builtin").lsp_type_definitions, defaults)
                    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, defaults)
                    vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, defaults)

                    -- Navigate diagnostics
                    vim.keymap.set("n", "gl", vim.diagnostic.open_float, defaults)
                    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, defaults)
                    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, defaults)

                    -- Show * symbols
                    vim.keymap.set("n", "<leader>sds", require("telescope.builtin").lsp_document_symbols, defaults)
                    vim.keymap.set(
                        "n",
                        "<leader>sws",
                        require("telescope.builtin").lsp_dynamic_workspace_symbols,
                        defaults
                    )

                    -- Inline help
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, defaults)
                    vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, defaults)

                    -- Code actions
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, defaults)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, defaults)
                    vim.keymap.set("n", "<leader>oi", function()
                        vim.lsp.buf.execute_command({
                            command = "_typescript.organizeImports",
                            arguments = { vim.fn.expand("%:p") },
                        })
                    end, defaults)
                end,
            })

            -- Enable virtual text
            vim.diagnostic.config({
                virtual_text = true,
            })
        end,
    },
}
