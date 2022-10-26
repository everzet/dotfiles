local opt = vim.opt
opt.ls = 3
opt.ch = 0

local modes = {
  ["n"] = "NORMAL",
  ["no"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "VISUAL LINE",
  [""] = "VISUAL BLOCK",
  ["s"] = "SELECT",
  ["S"] = "SELECT LINE",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rv"] = "VISUAL REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "VIM EX",
  ["ce"] = "EX",
  ["r"] = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}

local colors = {
  ["NORMAL"] = "%#StatusLine#",
  ["HIGHLIGHT"] = "%#DraculaOrangeInverse#",
}

local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  local mode_label = modes[current_mode]
  local mode_color = colors[mode_label] or colors["HIGHLIGHT"]
  return string.format("%s %s ", mode_color, mode_label):upper()
end

local function filepath()
  local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")
  if fpath == "" or fpath == "." then
    return ""
  end

  return string.format("%%<%s/", fpath)
end

local function filename()
  local fname = vim.fn.expand "%:t"
  if fname == "" then
    return ""
  end
  return fname .. " "
end

local function lsp()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = "%#LspDiagnosticsSignError#  " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = "%#LspDiagnosticsSignWarning#  " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = "%#LspDiagnosticsSignHint#  " .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = "%#LspDiagnosticsSignInformation#  " .. count["info"]
  end

  return errors .. warnings .. hints .. info .. " %#Normal#"
end

local function filetype()
  return string.format(" %s", vim.bo.filetype):upper()
end

local function lineinfo()
  if vim.bo.filetype == "alpha" then
    return ""
  end
  return " %P %l:%c "
end

function StatusLine()
  return table.concat {
    "%#Statusline#",
    mode(),
    "%#Normal# ",
    filepath(),
    filename(),
    "%#Normal#",
    lsp(),
    "%=%#StatusLineExtra#",
    filetype(),
    lineinfo(),
    "%#Normal#",
  }
end

function WinBar()
  return table.concat {
    "%=",
    "%m ",
    "%#Statusline#",
    " %f ",
    "%#Normal#",
  }
end

opt.winbar = "%!luaeval('WinBar()')"
opt.statusline = "%!luaeval('StatusLine()')"
