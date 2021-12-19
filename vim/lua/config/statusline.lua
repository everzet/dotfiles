local opt = vim.opt

local statusline = {
  '%#StatusLineNC#',
  '%.50f',
  '%=',
  '%y',
  ' %#statusline#',
  ' %p%%',
  '/%L',
  ' %l:%c '
}

opt.statusline = table.concat(statusline, '')
