local colors = {}

function colors.setup()
  -- Configure colorscheme
  vim.opt.termguicolors = true
  vim.cmd 'colorscheme dracula_pro'

  -- Italicise comments
  colors.update_hl('Comment', { italic = true })
end

function colors.get_hl(name)
  return vim.api.nvim_get_hl_by_name(name, true)
end

function colors.inherit_hl(from_name, to_name, overrides)
  local hl = colors.get_hl(from_name)
  for k, v in pairs(overrides) do
    hl[k] = v
  end
  vim.api.nvim_set_hl(0, to_name, hl)
end

function colors.update_hl(name, overrides)
  colors.inherit_hl(name, name, overrides)
end

return colors
