local colors = {
  dark0 = "#2d3443",
  dark1 = "#373e4d",
  bright_black = "#4c566a",
  bright_blue = "#7acbea",
  bright_cyan = "#a1d5f7",
  bright_green = "#44eb9f",
  bright_magenta = "#d8a6f4",
  bright_red = "#fa74b2",
  bright_white = "#f9f9f9",
  bright_orange = "#faa687",
  light_pink = "#ffd7d7",
  black = "#434c5e",
  blue = "#63c5ea",
  cyan = "#89ccf7",
  green = "#2be491",
  magenta = "#cf8ef4",
  light_magenta = "#e7aafe",
  red = "#fa5aa4",
  white = "#efefef",
  orange = "#fa946e",
  bright_yellow = "#f5d964",
  light_yellow = "#fbf3a5"
}

local nvim_groups = {
    Normal = { fg = colors.bright_white, bg = nil },
    Special = { fg = colors.bright_red, bold = true },
    Comment = { fg = colors.bright_black },
    LineNr = { fg = colors.bright_black },
    Constant = { fg = colors.cyan },
    String = { fg = colors.bright_orange, italic = true },
    Character = { fg = colors.bright_orange, bold = true },
    SpecialChar = { fg = colors.red, bold = true},
    Boolean = { fg = colors.bright_blue },
    Identifier = { fg = colors.light_magenta },
    Function = { fg = colors.magenta, bold = true },
    Statement = { fg = colors.red },
    Operator = { fg = colors.cyan , bold = true },
    Keyword = { fg = colors.red },
    Exception = { fg = colors.red },
    PreProc = { fg = colors.bright_cyan },
    Include = { fg = colors.blue, italic = true, nocombine = true },
    Define = { fg = colors.bright_cyan, italic = true },
    Macro = { fg = colors.bright_cyan },
    Type = { fg = colors.green, bold = true },
    Typedef = { link = "Type" },
    Structure = { fg = colors.orange, bold = true },
    Error = { fg = colors.black, bg = colors.bright_red },
    Todo = { fg = colors.green, bg = colors.bright_blue },
    NormalFloat = { bg = colors.dark0},
    FloatBorder = { fg = colors.bright_black },
    Directory = { fg = colors.bright_blue, bold = true },
    CursorLine = { fg = colors.red, italic = true, underline = true },
    Pmenu = { fg = colors.dark1, bg = colors.magenta },
    PmenuSel = { fg = colors.black, bg = colors.light_magenta },
    DiagnosticError = { fg = colors.red },
    DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
    DiagnosticWarn = { fg = colors.bright_yellow },
    DiagnosticUnderlineWarn = { undercurl = true, sp = colors.bright_yellow },
    DiagnosticInfo = { fg = colors.bright_cyan },
    DiagnosticUnderlineInfo = { undercurl = true, sp = colors.bright_blue },
    DiagnosticHint = { fg = colors.bright_white },
    DiagnosticUnderlineHint = { undercurl = true, sp = colors.white },
    Search = { fg = colors.black, bg = colors.bright_red },
    IncSearch = { link = "Search" },
    CurSearch = { link = "Search" },
}

local status_line_groups = {
    StatusLineEnd = { fg = colors.dark1, bg = colors.dark1 },
    NormalModeColor = { fg = colors.dark1, bg = colors.bright_cyan, bold = true },
    NormalModeSep = { fg = colors.bright_cyan, bg = colors.light_pink },
    FilenameColor = { fg = colors.dark1, bg = colors.light_pink },
    FilenameSepColor = { fg = colors.light_pink, bg = colors.dark1 },
    VisualModeColor = { fg = colors.dark1, bg = colors.bright_white, bold = true },
    VisualModeSep = { fg = colors.bright_white, bg = colors.light_pink },
    VisualLineModeColor = { link = "VisualModeColor" },
    VisualLineModeSep = { link = "VisualModeSep" },
    VisualBlockModeColor = { link = "VisualModeColor" },
    VisualBlockModeSep = { link = "VisualModeSep" },
    SelectModeColor = { link = "VisualModeColor" },
    SelectModeSep = { link = "VisualModeSep" },
    SelectLineModeColor = { link = "VisualModeColor" },
    SelectLineModeSep = { link = "VisualModeSep" },
    SelectBlockModeColor = { link = "VisualModeColor" },
    SelectBlockModeSep = { link = "VisualModeSep" },
    InsertModeColor = { fg = colors.dark1, bg = colors.green, bold = true },
    InsertModeSep = { fg = colors.green, bg = colors.light_pink },
    ReplaceModeColor = { fg = colors.dark1, bg = colors.red, bold = true },
    ReplaceModeSep = { fg = colors.red, bg = colors.light_pink },
    VisualReplaceModeColor = { fg = colors.dark1, bg = colors.bright_red, bold = true },
    VisualReplaceModeSep = { fg = colors.bright_red, bg = colors.light_pink },
    CommandModeColor = { fg = colors.dark1, bg = colors.magenta, bold = true },
    CommandModeSep = { fg = colors.magenta, bg = colors.light_pink },
    VimExModeColor = { link = "CommandModeColor" },
    VimExModeSep = { link = "CommandModeSep" },
    ExModeColor = { link = "CommandModeColor" },
    ExModeSep = { link = "CommandModeSep" },
    PromptModeColor = { link = "CommandModeColor" },
    PromptModeSep = { link = "CommandModeSep" },
    ShellModeColor = { link = "CommandModeColor" },
    ShellModeSep = { link = "CommandModeSep" },
    TerminalModeColor = { link = "CommandModeColor" },
    TerminalModeSep = { fg = colors.magenta, bg = colors.dark1 },
}

local haskell_groups = {
    VarId = { fg = colors.magenta },
    ConId = { link = "Type" },
    hsVarSym = { fg = colors.bright_cyan, bold = true },
    hsConSym = { fg = colors.red, bold = true },
    hsNumber = { fg = colors.blue }
}

local lua_groups = {
    ["@lsp.typemod.variable.declaration.lua"] = { fg = colors.magenta, nocombine = true },
    ["@lsp.mod.declaration.lua"] = { fg = colors.bright_red, bold = true },
    ["@lsp.type.variable.lua"] = { fg = colors.magenta },
    ["@lsp.type.property.lua"] = { fg = colors.bright_magenta }
}

local rust_groups = {
    rustLifetime = { fg = colors.light_pink, italic = true, nocombine = true },
    rustStructure = { fg = colors.magenta },
    rustMacro = { fg = colors.bright_cyan, italic = true },
    rustStorage = { fg = colors.bright_green, nocombine = true },
    ["@lsp.type.variable.rust"] = { fg = colors.light_magenta },
    ["@lsp.type.parameter.rust"] = { fg = colors.orange },
    ["@lsp.type.typeAlias.rust"] = { fg = colors.green },
    ["@lsp.type.struct.rust"] = { fg = colors.orange, bold = true },
    ["@lsp.type.enum.rust"] = { fg = colors.light_orange },
    ["@lsp.type.selfKeyword.rust"] = { fg = colors.blue, italic = true },
    ["@lsp.type.macro.rust"] = { fg = colors.bright_cyan, nocombine = true },
    ["@lsp.typemod.struct.declaration.rust"] = { fg = colors.orange, bold = true },
    ["@lsp.type.interface.rust"] = { fg = colors.light_yellow, nocombine = true },
    ["@lsp.mod.crateRoot.rust"] = { fg = colors.bright_cyan, italic = true, nocombine = true },
    ["@lsp.typemod.namespace.library.rust"] = { fg = colors.bright_cyan, italic = true, nocombine = true }
}

for _, groups in ipairs({
    nvim_groups,
    status_line_groups,
    haskell_groups,
    lua_groups,
    rust_groups
}) do
    for group, settings in pairs(groups) do
        vim.api.nvim_set_hl(0, group, settings)
    end
end

