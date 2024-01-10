-- Language servers
return {

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      -- Autocompletion
      'hrsh7th/cmp-nvim-lsp',
      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
      -- Status updates for LSP
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
    },
    config = function(_, _)
      require('mason').setup()
      require('mason-lspconfig').setup()
      require('neodev').setup {}

      -- Install and configure LSP servers
      local server_settings = {
        elixirls = {},
        tsserver = {},
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      }

      -- Configure capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      -- Configure Mason
      local mason_lspconfig = require 'mason-lspconfig'
      mason_lspconfig.setup { ensure_installed = vim.tbl_keys(server_settings) }
      mason_lspconfig.setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            settings = server_settings[server_name],
            filetypes = (server_settings[server_name] or {}).filetypes,
          }
        end,
      }

      -- Keybinds
      vim.api.nvim_create_autocmd({ 'LspAttach' }, {
        group = vim.api.nvim_create_augroup('ConfigureLspKeymaps', {}),
        callback = function(e)
          local nmap = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = e.buf, desc = desc })
          end

          -- Go *
          nmap('gd', function()
            require('telescope.builtin').lsp_definitions(require('telescope.themes').get_cursor { winblend = 20, previewer = false })
          end, '[G]oto [D]efinition')
          nmap('gr', function()
            require('telescope.builtin').lsp_references(require('telescope.themes').get_cursor { winblend = 20, previewer = true })
          end, '[G]oto [R]eferences')
          nmap('gI', function()
            require('telescope.builtin').lsp_implementations(require('telescope.themes').get_cursor { winblend = 20, previewer = true })
          end, '[G]oto [I]mplementation')
          nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          nmap('<leader>D', function()
            require('telescope.builtin').lsp_type_definitions(require('telescope.themes').get_cursor { winblend = 20, previewer = false })
          end, 'Type [D]efinition')
          nmap('<leader>ds', function()
            require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_dropdown { winblend = 20, previewer = false })
          end, '[D]ocument [S]ymbols')
          nmap('<leader>ws', function()
            require('telescope.builtin').lsp_dynamic_workspace_symbols(require('telescope.themes').get_dropdown { previewer = true })
          end, '[W]orkspace [S]ymbols')

          -- Inline help
          nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
          nmap('<C-k>', vim.lsp.buf.signature_help, '[P]arameters [D]ocumentation')

          -- Code actions
          nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame Symbol')
          nmap('<leader>oi', function()
            vim.lsp.buf.execute_command {
              command = '_typescript.organizeImports',
              arguments = { vim.fn.expand '%:p' },
            }
          end, '[O]rganize [I]mports')
        end,
      })
    end,
  },
}
