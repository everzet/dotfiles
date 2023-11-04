-- Language servers
return {

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Package Manager
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            -- Autocompletion
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            -- Snippets
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        config = function(_, _)
            -- Setup LSP management UI (Mason)
            require("mason").setup()
            require("mason-lspconfig").setup({
                -- Always install following servers
                ensure_installed = { "elixirls", "tsserver", "lua_ls" },
            })

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

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
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
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
                    local nmap = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = desc })
                    end

                    -- Go *
                    nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
                    nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                    nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
                    nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                    nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
                    nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
                    nmap(
                        "<leader>ws",
                        require("telescope.builtin").lsp_dynamic_workspace_symbols,
                        "[W]orkspace [S]ymbols"
                    )

                    -- Navigate diagnostics
                    nmap("<leader>e", vim.diagnostic.open_float, "See [E]rror")
                    nmap("[d", vim.diagnostic.goto_prev, "Previous deiagnostic")
                    nmap("]d", vim.diagnostic.goto_next, "Next diagnostic")

                    -- Inline help
                    nmap("K", vim.lsp.buf.hover, "Hover Documentation")
                    nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

                    -- Code actions
                    nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
                    nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame Symbol")
                end,
            })

            -- Enable virtual text
            vim.diagnostic.config({
                virtual_text = true,
            })
        end,
    },
}
