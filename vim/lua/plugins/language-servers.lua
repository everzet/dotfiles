-- Language servers
return {

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
                ensure_installed = { "elixirls", "tsserver", "lua_ls" },
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
                    local buf = ev.buf
                    local tscope = require("telescope.builtin")

                    -- Go *
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = buf, desc = "Declaration" })
                    vim.keymap.set("n", "gd", tscope.lsp_definitions, { buffer = buf, desc = "Definitions" })
                    vim.keymap.set("n", "go", tscope.lsp_type_definitions, { buffer = buf, desc = "Type definitions" })
                    vim.keymap.set("n", "gr", tscope.lsp_references, { buffer = buf, desc = "References" })
                    vim.keymap.set("n", "gi", tscope.lsp_implementations, { buffer = buf, desc = "Implementations" })

                    -- Navigate diagnostics
                    vim.keymap.set("n", "gl", vim.diagnostic.open_float, { buffer = buf, desc = "Show diagnostics" })
                    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = buf, desc = "Previous deiagnostic" })
                    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = buf, desc = "Next diagnostic" })

                    -- Show * symbols
                    vim.keymap.set(
                        "n",
                        "<leader>sds",
                        tscope.lsp_document_symbols,
                        { buffer = buf, desc = "Document symbols" }
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>sws",
                        tscope.lsp_dynamic_workspace_symbols,
                        { buffer = buf, desc = "Workspace symbols" }
                    )

                    -- Inline help
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buf, desc = "Symbol info" })
                    vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { buffer = buf, desc = "Help" })

                    -- Code actions
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = buf, desc = "Code action" })
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = buf, desc = "Rename symbol" })
                    vim.keymap.set("n", "<leader>oi", function()
                        vim.lsp.buf.execute_command({
                            command = "_typescript.organizeImports",
                            arguments = { vim.fn.expand("%:p") },
                        })
                    end, { buffer = buf, desc = "Organize imports" })
                end,
            })

            -- Enable virtual text
            vim.diagnostic.config({
                virtual_text = true,
            })
        end,
    },
}
