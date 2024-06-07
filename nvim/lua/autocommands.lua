local current_buf = 0

function create_header_link()
    local line = vim.api.nvim_get_current_line()
    if string.find(line, "#") == nil then
        return
    end

    -- Trim spaces around the string and # at the beginning
    local l = 1
    while string.find(" #", string.sub(line, l, l)) ~= nil do
        l = l + 1
    end

    local r = string.len(line)
    while string.sub(line, r, r) == ' ' do
        r = r - 1
    end

    identifier = string.sub(line, l, r)
    identifier = identifier:gsub(" ", "_")

    local new_line = table.concat({line, ' <a id="', identifier, '"> </a>'}, "")
    vim.api.nvim_set_current_line(new_line)
end

local function markdown_keybinds()
    local keybind_opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(current_buf, 'n', '<space>hl', ':lua create_header_link()<CR>', keybind_opts)
end

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.md"},
    callback = markdown_keybinds
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.heex" },
    command = "set syntax=html"
})

