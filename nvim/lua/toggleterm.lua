local terminal = {}

function term_detached()
    terminal[1] = nil
end

function ToggleTerm()
    if terminal[1] == nil then
        vim.cmd("split | resize 15 | terminal")
        terminal[1] = vim.api.nvim_win_get_buf(0)
        vim.api.nvim_buf_attach(0, false, { on_detach = term_detached })
        vim.cmd("normal i")
    else
        vim.api.nvim_buf_delete(terminal[1], { force = true })
        terminal[1] = nil
    end
end
