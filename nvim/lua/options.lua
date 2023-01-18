require('statusline')
vim.cmd('colorscheme custom')

local options = {
    mouse = "a",
    clipboard = "unnamedplus",
    completeopt = "menuone,preview",
    fileencoding = "utf-8",
    number = true,
    relativenumber = true,
    hlsearch = false,
    syntax = "on",
    wrap = false,
    expandtab = true,
    tabstop = 4,
    shiftwidth = 4,
    autoindent = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    statusline = "%!v:lua.StatusLine()",
    showmode = false
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
