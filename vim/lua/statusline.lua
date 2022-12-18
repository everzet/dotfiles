local modes = {
    ['n'] = 'NORMAL',
    ['no'] = 'NORMAL',
    ['v'] = 'VISUAL',
    ['V'] = 'VISUAL LINE',
    [''] = 'VISUAL BLOCK',
    ['s'] = 'SELECT',
    ['S'] = 'SELECT LINE',
    ['i'] = 'INSERT',
    ['ic'] = 'INSERT',
    ['R'] = 'REPLACE',
    ['Rv'] = 'VISUAL REPLACE',
    ['c'] = 'COMMAND',
    ['cv'] = 'VIM EX',
    ['ce'] = 'EX',
    ['r'] = 'PROMPT',
    ['rm'] = 'MOAR',
    ['r?'] = 'CONFIRM',
    ['!'] = 'SHELL',
    ['t'] = 'TERMINAL',
}

local colors = {
    ['NORMAL'] = '%#StatusLine#',
    ['HIGHLIGHT'] = '%#DraculaOrangeInverse#',
}

local function current_mode()
    local current_mode = vim.api.nvim_get_mode().mode
    local mode_label = modes[current_mode]
    local mode_color = colors[mode_label] or colors['HIGHLIGHT']
    return string.format('%s %s ', mode_color, mode_label):upper()
end

local function current_filepath()
    local filepath = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.:h')
    if filepath == '' or filepath == '.' then
        return ' '
    end
    return string.format(' %%<%s/', filepath)
end

local function current_filename()
    local filename = vim.fn.expand '%:t'
    if filename == '' then
        return ' '
    end
    return filename .. ' '
end

local function current_diagnostics()
    local count = {}
    local levels = {
        errors = 'Error',
        warnings = 'Warn',
        info = 'Info',
        hints = 'Hint',
    }

    for k, level in pairs(levels) do
        count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
    end

    local errors = ''
    local warnings = ''
    local hints = ''
    local info = ''

    if count['errors'] ~= 0 then
        errors = ' %#LspDiagnosticsError# ' .. count['errors']
    end
    if count['warnings'] ~= 0 then
        warnings = ' %#LspDiagnosticsWarning# ' .. count['warnings']
    end
    if count['hints'] ~= 0 then
        hints = ' %#LspDiagnosticsHint# ' .. count['hints']
    end
    if count['info'] ~= 0 then
        info = ' %#LspDiagnosticsInformation# ' .. count['info']
    end

    return errors .. warnings .. hints .. info .. ' %#Normal#'
end

local function current_filetype()
    return string.format(' %s', vim.bo.filetype):upper()
end

local function current_lineinfo()
    if vim.bo.filetype == 'alpha' then
        return ''
    end
    return ' %P %l:%c '
end

function StatusLine()
    return table.concat {
        '%#Statusline#',
        current_mode(),
        '%#Normal#',
        current_filepath(),
        current_filename(),
        '%#Normal#',
        current_diagnostics(),
        '%=%#StatusLineExtra#',
        current_filetype(),
        current_lineinfo(),
        '%#Normal#',
    }
end

vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.opt.winbar = '%=%m %#Statusline# %f %#Normal#'
vim.opt.statusline = "%!luaeval('StatusLine()')"
