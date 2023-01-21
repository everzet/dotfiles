local status = {}

status.trunc_width = setmetatable({
    mode       = 80,
    git_status = 90,
    git_branch = 15,
    lsp_diag   = 90,
    lsp_name   = 10,
    line_col   = 90,
}, {
    __index = function() return 80 end
})

status.is_truncated = function(_, width)
    local current_width = vim.api.nvim_win_get_width(0)
    return current_width < width
end

status.truncate_text = function(_, str, width)
    return string.sub(str, 1, width) .. (string.len(str) > width and '…' or '') .. ''
end

status.modes = setmetatable({
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

status.get_current_mode = function(self)
    local current_mode = vim.api.nvim_get_mode().mode
    local current_color = current_mode == 'n' and '' or '%#StatusLineMode#'

    if self:is_truncated(self.trunc_width.mode) then
        return string.format('%s %s ', current_color, self.modes[current_mode][2]):upper()
    end

    return string.format('%s %s ', current_color, self.modes[current_mode][1]):upper()
end

status.get_git_status = function(self)
    -- use fallback because it doesn't set this variable on the initial `BufEnter`
    local signs = vim.b.gitsigns_status_dict or { head = '', added = 0, changed = 0, removed = 0 }
    local is_head_present = signs.head ~= ''
    local result = {}
    local status = {
        added = '%#StatusLineAdd#+',
        changed = '%#StatusLineChange#~',
        removed = '%#StatusLineDelete#-',
    }
    local reset = '%#StatusLineBg2#'

    for type, label in pairs(status) do
        local count = signs[type]
        if count and count > 0 then
            local text = string.format('%s%d%s', label, count, reset)
            table.insert(result, text)
        end
    end

    local status_text = table.concat(result, ' ')
    local branch_text = is_head_present and string.format(' %s', signs.head or '') or ''
    if branch_text == '' then return '' end

    if self:is_truncated(self.trunc_width.git_status) then
        return ' ' .. self:truncate_text(branch_text, self.trunc_width.git_branch) .. ' '
    end

    return is_head_present and string.format(
        ' %s %s',
        branch_text,
        status_text ~= '' and string.format(' %s ', table.concat(result, ' ')) or ''
    ) or ''
end

status.get_filename = function()
    local file_name, file_ext = vim.fn.expand('%:t'), vim.fn.expand('%:e')
    local icon = require 'nvim-web-devicons'.get_icon(file_name, file_ext, { default = true })
    return string.format(' %s %%<%%f %%m ', icon)
end

status.get_lsp_diag = function(self)
    local result = {}
    local levels = {
        Error = '%#StatusLineError#',
        Warn = '%#StatusLineWarning#',
        Info = '%#StatusLineInformation#',
        Hint = '%#StatusLineHint#',
    }
    local reset = '%#StatusLineBg2#'

    for level, label in pairs(levels) do
        local count = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
        if count > 0 then
            local text = string.format('%s %d%s', label, count, reset)
            table.insert(result, text)
        end
    end

    local diag_text = table.concat(result, ' ')

    local bufnr = vim.api.nvim_get_current_buf()
    local client = vim.lsp.get_active_clients({ bufnr = bufnr })[1]
    local client_text = client and string.format(' %s', client.name) or ''

    if client_text == '' then return '' end

    if self:is_truncated(self.trunc_width.lsp_diag) then
        return ' ' .. self:truncate_text(client_text, self.trunc_width.lsp_name) .. ' '
    end

    return string.format('%s %s ',
        diag_text ~= '' and string.format(' %s ', diag_text) or '',
        client_text
    )
end

status.get_line_col = function(self)
    if self:is_truncated(self.trunc_width.line_col) then
        return ' %l:%c '
    else
        return ' ﴜ %03l:%03c '
    end
end

status.set_active = function(self)
    return table.concat({
        '%#StatusLineBg1#', self:get_current_mode(),
        '%#StatusLineBg2#', self:get_git_status(),
        '%#StatusLineBg3#', '%=', self:get_filename(), '%=',
        '%#StatusLineBg2#', self:get_lsp_diag(),
        '%#StatusLineBg1#', self:get_line_col(),
    })
end

status.set_inactive = function()
    return table.concat({
        '%#StatusLineBg3#%=', '%<%f %m', '%='
    })
end

status.set_gui_window = function(self, name)
    return table.concat({
        '%#StatusLineMode#', string.format(' %s ', name),
        '%#StatusLineBg3#', '%=%=',
        '%#StatusLineBg1#', self:get_line_col(),
    })
end

-- Global callable object
StatusLine = setmetatable(status, {
    __call = function(self, mode)
        if mode == 'inactive' then return self:set_inactive() end
        if vim.bo.filetype == 'fugitive' then return self:set_gui_window(' fugitive') end
        if mode == 'active' then return self:set_active() end
    end
})

-- Swap statusline on buffer change
local augroup = vim.api.nvim_create_augroup('Everzet_StatusLine', { clear = true })
vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' },
    { command = "setlocal statusline=%!v:lua.StatusLine('active')", group = augroup })
vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave' },
    { command = "setlocal statusline=%!v:lua.StatusLine('inactive')", group = augroup })

-- Style statusline
local colors = require('colors')

colors.inherit_hl('CursorColumn', 'StatusLineBg1', {})
colors.inherit_hl('DraculaBgLighter', 'StatusLineBg2', {})
colors.inherit_hl('DraculaBgLight', 'StatusLineBg3', {})
colors.inherit_hl('WildMenu', 'StatusLineMode', {})
local status_line_bg2 = colors.get_hl('StatusLineBg2')['background']

colors.inherit_hl('DiffAdd', 'StatusLineAdd', { background = status_line_bg2 })
colors.inherit_hl('DiffChange', 'StatusLineChange', { background = status_line_bg2 })
colors.inherit_hl('DiffDelete', 'StatusLineDelete', { background = status_line_bg2 })

colors.inherit_hl('LspDiagnosticsError', 'StatusLineError', { background = status_line_bg2 })
colors.inherit_hl('LspDiagnosticsWarning', 'StatusLineWarning', { background = status_line_bg2 })
colors.inherit_hl('LspDiagnosticsInformation', 'StatusLineInformation', { background = status_line_bg2 })
colors.inherit_hl('LspDiagnosticsHint', 'StatusLineHint', { background = status_line_bg2 })
