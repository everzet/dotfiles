Colors = {}

function Colors.setup()
    -- Configure colorscheme
    vim.opt.termguicolors = true
    vim.cmd 'colorscheme dracula_pro'

    -- Italicise comments
    Colors.update_hl('Comment', { italic = true })
end

function Colors.get_hl(name)
    return vim.api.nvim_get_hl_by_name(name, true)
end

function Colors.update_hl(name, overrides)
    local hl = vim.api.nvim_get_hl_by_name(name, true)
    for k, v in pairs(overrides) do hl[k] = v end
    vim.api.nvim_set_hl(0, name, hl)
end

function Colors.inherit_hl(from_name, to_name, overrides)
    local hl = vim.api.nvim_get_hl_by_name(from_name, true)
    for k, v in pairs(overrides) do hl[k] = v end
    vim.api.nvim_set_hl(0, to_name, hl)
end

return Colors
