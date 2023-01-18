local modes = {
  ["n"] = table.concat{"%#NormalModeColor#", "NORMAL", "%#NormalModeSep#", ""},
  ["no"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "VISUAL LINE",
  [""] = "VISUAL BLOCK",
  ["s"] = "SELECT",
  ["S"] = "SELECT LINE",
  [""] = "SELECT BLOCK",
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

-- 0: Black  4: Blue
-- 1: Red    5: Magenta  + 8 bright version
-- 2: Green  6: Cyan 
-- 3: Yellow 7: White
-- 16: Background color

function StatusLine()
    local current_mode = vim.api.nvim_get_mode().mode
    return table.concat{modes[current_mode]}
end
--a ="Normal"
--string.format("%s", a):upper()
--NORMAL
