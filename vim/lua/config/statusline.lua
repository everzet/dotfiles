local opt = vim.opt

local statusline = {
  '%#IncSearch#',
  '%m',
  '  %{mode()}',
  '  %#LineNr#',
  ' %.50f',
  '%=',
  '%y',
  ' %#PmenuSel#',
  ' %p%%',
  '/%L',
  ' %l:%c '
}

opt.statusline = table.concat(statusline, '')
