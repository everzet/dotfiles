return {
  { -- Manage non-LSP tools
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
    },
    opts = {
      ensure_installed = {
        'stylua', -- Used to format lua code
        'prettierd', -- Used to format TS/JS/JSON/MD code
      },
    },
  },
}
