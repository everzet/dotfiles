local formatter = require('formatter')
local map = vim.api.nvim_set_keymap

map('n', '<leader>f', ':Format<cr>', {noremap = true, silent = true})

local prettier = function()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
    stdin = true
  }
end

local mix = function()
  return {
    exe = "mix",
    args = {"format", "-"},
    stdin = true
  }
end

formatter.setup {
  filetype = {
    javascript = { prettier },
    typescript = { prettier },
    typescriptreact = { prettier },
    elixir = { mix },
  }
}
