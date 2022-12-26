vim.opt.termguicolors = true
vim.cmd 'colorscheme dracula_pro'

local function update_hl(name, overrides)
    local hl = vim.api.nvim_get_hl_by_name(name, true)
    for k, v in pairs(overrides) do hl[k] = v end
    vim.api.nvim_set_hl(0, name, hl)
end

local function inherit_hl(from_name, to_name, overrides)
    local hl = vim.api.nvim_get_hl_by_name(from_name, true)
    for k, v in pairs(overrides) do hl[k] = v end
    vim.api.nvim_set_hl(0, to_name, hl)
end

-- Italicise comments
update_hl('Comment', { italic = true })

-- Style statusline
inherit_hl('CursorColumn', 'StatusLineBg1', {})
inherit_hl('DraculaBgLighter', 'StatusLineBg2', {})
inherit_hl('DraculaBgLight', 'StatusLineBg3', {})
inherit_hl('WarningMsg', 'StatusLineMode', {})

local status_line_bg2 = vim.api.nvim_get_hl_by_name('StatusLineBg2', true)['background']

inherit_hl('DiffAdd', 'StatusLineAdd', { background = status_line_bg2 })
inherit_hl('DiffChange', 'StatusLineChange', { background = status_line_bg2 })
inherit_hl('DiffDelete', 'StatusLineDelete', { background = status_line_bg2 })

inherit_hl('LspDiagnosticsError', 'StatusLineError', { background = status_line_bg2 })
inherit_hl('LspDiagnosticsWarning', 'StatusLineWarning', { background = status_line_bg2 })
inherit_hl('LspDiagnosticsInformation', 'StatusLineInformation', { background = status_line_bg2 })
inherit_hl('LspDiagnosticsHint', 'StatusLineHint', { background = status_line_bg2 })
