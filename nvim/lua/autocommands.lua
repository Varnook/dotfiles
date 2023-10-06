vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.heex" }, 
    command = "set syntax=html" 
})
