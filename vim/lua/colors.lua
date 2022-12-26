M = {}

function M.setup()
    vim.opt.termguicolors = true
    vim.cmd 'colorscheme dracula_pro'

    -- Italicise comments
    M.update_hl('Comment', { italic = true })
end

function M.get_hl(name)
    return vim.api.nvim_get_hl_by_name(name, true)
end

function M.update_hl(name, overrides)
    local hl = vim.api.nvim_get_hl_by_name(name, true)
    for k, v in pairs(overrides) do hl[k] = v end
    vim.api.nvim_set_hl(0, name, hl)
end

function M.inherit_hl(from_name, to_name, overrides)
    local hl = vim.api.nvim_get_hl_by_name(from_name, true)
    for k, v in pairs(overrides) do hl[k] = v end
    vim.api.nvim_set_hl(0, to_name, hl)
end

return M
