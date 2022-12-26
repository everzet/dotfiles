local M = {}

M.trunc_width = setmetatable({
    mode       = 80,
    git_status = 90,
}, {
    __index = function()
        return 80
    end
})

M.is_truncated = function(_, width)
    local current_width = vim.api.nvim_win_get_width(0)
    return current_width < width
end

M.modes = setmetatable({
    ['n']  = { 'Normal', 'N' };
    ['no'] = { 'N·Pending', 'N·P' };
    ['v']  = { 'Visual', 'V' };
    ['V']  = { 'V·Line', 'V·L' };
    ['']  = { 'V·Block', 'V·B' }; -- this is not ^V, but it's , they're different
    ['s']  = { 'Select', 'S' };
    ['S']  = { 'S·Line', 'S·L' };
    ['']  = { 'S·Block', 'S·B' }; -- same with this one, it's not ^S but it's 
    ['i']  = { 'Insert', 'I' };
    ['ic'] = { 'Insert', 'I' };
    ['R']  = { 'Replace', 'R' };
    ['Rv'] = { 'V·Replace', 'V·R' };
    ['c']  = { 'Command', 'C' };
    ['cv'] = { 'Vim·Ex ', 'V·E' };
    ['ce'] = { 'Ex ', 'E' };
    ['r']  = { 'Prompt ', 'P' };
    ['rm'] = { 'More ', 'M' };
    ['r?'] = { 'Confirm ', 'C' };
    ['!']  = { 'Shell ', 'S' };
    ['t']  = { 'Terminal ', 'T' };
}, {
    __index = function()
        return { 'Unknown', 'U' } -- handle edge cases
    end
})

M.get_current_mode = function(self)
    local current_mode = vim.api.nvim_get_mode().mode
    local current_color = current_mode == 'n' and '%#CursorLine#' or '%#WildMenu#'

    if self:is_truncated(self.trunc_width.mode) then
        return string.format('%s %s ', current_color, self.modes[current_mode][2]):upper()
    end

    return string.format('%s %s ', current_color, self.modes[current_mode][1]):upper()
end

M.get_git_status = function(self)
    -- use fallback because it doesn't set this variable on the initial `BufEnter`
    local signs = vim.b.gitsigns_status_dict or { head = '', added = 0, changed = 0, removed = 0 }
    local is_head_empty = signs.head ~= ''

    if self:is_truncated(self.trunc_width.git_status) then
        return is_head_empty and string.format('  %s ', signs.head or '') or ''
    end

    return is_head_empty and string.format(
        ' +%s ~%s -%s |  %s ',
        signs.added, signs.changed, signs.removed, signs.head
    ) or ''
end

M.get_filename = function()
    local file_name, file_ext = vim.fn.expand('%:t'), vim.fn.expand('%:e')
    local icon = require 'nvim-web-devicons'.get_icon(file_name, file_ext, { default = true })
    return string.format(' %s %%<%%f %%m ', icon)
end

M.get_line_col = function()
    return ' LN %l, CL %c '
end

M.get_lsp_diag = function()
    local result = {}
    local levels = {
        Error = '%#LspDiagnosticsError#',
        Warn = '%#LspDiagnosticsWarning#',
        Info = '%#LspDiagnosticsInformation#',
        Hint = '%#LspDiagnosticsHint#',
    }

    for level, label in pairs(levels) do
        local count = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
        if count > 0 then
            local text = string.format('%s %d', label, count)
            table.insert(result, text)
        end
    end

    local diag_text = table.concat(result, ' ')
    if diag_text == '' then return '' end
    return string.format('%%#Normal# %s ', diag_text)
end

M.set_active = function(self)
    return table.concat({
        self:get_current_mode(),
        '%#StatusLineNC#', self:get_git_status(),
        '%#StatusLine#', '%=', self:get_filename(), '%=',
        '%#Normal#', self:get_lsp_diag(),
        '%#StatusLineNC#', self:get_line_col(),
    })
end

M.set_inactive = function()
    return table.concat({
        '%=', '%<%f %m', '%='
    })
end

StatusLine = setmetatable(M, {
    __call = function(statusline, mode)
        if mode == 'active' then return statusline:set_active() end
        if mode == 'inactive' then return statusline:set_inactive() end
    end
})

local group = vim.api.nvim_create_augroup('StatusLine', { clear = true })
vim.api.nvim_create_autocmd({'WinEnter', 'BufEnter'}, { command = "setlocal statusline=%!v:lua.StatusLine('active')", group = group })
vim.api.nvim_create_autocmd({'WinLeave', 'BufLeave'}, { command = "setlocal statusline=%!v:lua.StatusLine('inactive')", group = group })
