-- Holds root directories with each of their clients, for example:
-- { root_dir_1 = { client_id_1 = 1, client_id_2 = 2 }, root_dir_2 = { client_id_1 = 3 } }
local current_buf = 0
local clients = {}

local get_root_dir = function(root_pattern)
    return vim.fs.dirname(vim.fs.find(root_pattern, { path = vim.api.nvim_buf_get_name(current_buf),  upward = true })[1])
end

local function initialize_client(conf)
    if not clients[conf.root_dir] then
        clients[conf.root_dir] = {}
    end 
    
    clients[conf.root_dir][conf.name] = vim.lsp.start_client(conf)
end

local function load_client_from_cache(conf)
    if not clients[conf.root_dir] or not clients[conf.root_dir][conf.name] then
        initialize_client(conf) 
    end
    return clients[conf.root_dir][conf.name]
end

local function start_rust_analyzer()
    local conf = { name = "rust_analyzer", cmd = {"rust-analyzer"}, root_dir = get_root_dir({"Cargo.toml"}) }
    vim.lsp.buf_attach_client(current_buf, load_client_from_cache(conf))
end

local win_opts = {
    focusable = false,
    border = "single",
    header = {'', "highlight hl-DiagnosticError ctermbg = 1"}
}

vim.diagnostic.config({ virtual_text = false , float = win_opts})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.rs"},
    callback = start_rust_analyzer
})
