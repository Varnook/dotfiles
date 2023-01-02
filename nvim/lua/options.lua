vim.cmd('colorscheme custom')

local options = {
    mouse = "a",
    clipboard = "unnamedplus",
    fileencoding = "utf-8",
    number = true,
    relativenumber = true,
    hlsearch = false,
    wrap = false,
    expandtab = true,
    tabstop = 4,
    shiftwidth = 4,
    autoindent = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
