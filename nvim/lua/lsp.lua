function rust_analyzer()
    vim.lsp.buf_attach_client(
        0, 
        vim.lsp.start_client({
            cmd = {"rust-analyzer"},
            root_dir = vim.fs.dirname(vim.fs.find({"Cargo.toml"}, { path = vim.api.nvim_buf_get_name(0),  upward = true })[1]),
        })
    )
end

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.rs"},
    callback = rust_analyzer
})
