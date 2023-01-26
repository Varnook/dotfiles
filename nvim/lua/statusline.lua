local modes = {
  ["n"] = "Normal",
  ["no"] = "Normal",
  ["v"] = "Visual",
  ["V"] = "Visual Line",
  [""] = "Visual Block",
  ["s"] = "Select",
  ["S"] = "Select Line",
  [""] = "Select BBock",
  ["i"] = "Insert",
  ["ic"] = "Insert",
  ["R"] = "Replace",
  ["Rv"] = "Visual Replace",
  ["c"] = "Command",
  ["cv"] = "Vim Ex",
  ["ce"] = "Ex",
  ["r"] = "Prompt",
  ["rm"] = "Moar",
  ["r?"] = "Confirm",
  ["!"] = "Shell",
  ["t"] = "Terminal",
}

local mode_color = "ModeColor"
local mode_sep_color = "ModeSep"
local separator = ""

local function display_mode()
    local current_mode = modes[vim.api.nvim_get_mode().mode]
    local current_mode_color = "%#" .. current_mode:gsub("%s+", "") .. mode_color .. "#"
    local current_mode_sep_color = "%#" .. current_mode:gsub("%s+", "") .. mode_sep_color .. "#"
    return current_mode_color .. current_mode:upper() .. current_mode_sep_color .. separator
end

local function display_filename()
    local path_filename = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.") 
    local filename_color = "%#FilenameColor#"
    local filename_sep_color = "%#FilenameSepColor#"
    local modified = "" 
    if vim.api.nvim_eval("&modified") ~= 0 then
        modified = "  "
    elseif vim.api.nvim_eval("&readonly") ~= 0 then
        modified = "  "
    end
    return filename_color .. path_filename .. modified .. filename_sep_color .. separator
end

function status_line()
    return table.concat{display_mode(), display_filename() .. "%#StatusLineEnd#"}
end
