-- Holds root directories with each of their clients, for example:
-- { root_dir_1 = { client_id_1 = 1, client_id_2 = 2 }, root_dir_2 = { client_id_1 = 3 } }
local current_buf = 0
local clients = {}

local function get_root_dir(root_pattern)
    local full_path = vim.fs.find(root_pattern, {
        path = vim.api.nvim_buf_get_name(current_buf), 
        upward = true, 
        stop = vim.loop.os_homedir()
    })

    if full_path == nil or not string.find(full_path[1], root_pattern) then
        return "default"
    else
        return vim.fs.dirname(full_path[1])
    end
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

function apply_feature(usr_features)
    if usr_features == "" then
        usr_features = {vim.fn.input("")}
    end
    local conf = { 
        name = "rust_analyzer", 
        cmd = {"rust-analyzer"}, 
        init_options = {cargo={features=usr_features}}, 
        root_dir = get_root_dir("Cargo.toml")
    }
    local client_id = load_client_from_cache(conf)
    vim.lsp.buf_detach_client(current_buf, client_id)
    vim.lsp.stop_client(client_id)
    initialize_client(conf)
    vim.lsp.buf_attach_client(current_buf, load_client_from_cache(conf))
end

local function start_rust_analyzer()
    local conf = { 
        name = "rust_analyzer", 
        cmd = {"rust-analyzer"}, 
        root_dir = get_root_dir("Cargo.toml")
    }
    vim.lsp.buf_attach_client(current_buf, load_client_from_cache(conf))
    -- til: space ≠ Space. Space works with just one key after it, while space can take more
    vim.api.nvim_buf_set_keymap(current_buf, 'n', '<space>fa', ':lua apply_feature("all")<CR>', {})
    vim.api.nvim_buf_set_keymap(current_buf, 'n', '<space>fA', ':lua apply_feature(nil)<CR>', {})
    vim.api.nvim_buf_set_keymap(current_buf, 'n', '<space>F', ':lua apply_feature("")<CR>', {})
end

local function start_pylsp()
    local conf = { name = "pylsp", cmd = {"pylsp"}, root_dir = get_root_dir("__init__.py") }
    vim.lsp.buf_attach_client(current_buf, load_client_from_cache(conf))
end

local function start_clangd()
    local conf = { name = "clangd", cmd = {"clangd"}, root_dir = get_root_dir("compile_commands.json") }
    vim.lsp.buf_attach_client(current_buf, load_client_from_cache(conf))
end

local win_opts = {
    focusable = false,
    border = "single",
    scope = "cursor",
    severity_sort = true,
    header = "",
    source = "if_many",
    prefix = ""
}

vim.cmd("sign define DiagnosticSignError text= texthl=DiagnosticSignError")
vim.cmd("sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn")
vim.cmd("sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo")
vim.cmd("sign define DiagnosticSignHint text= texthl=DiagnosticSignHint")

vim.diagnostic.config({ virtual_text = false , float = win_opts})

local function preview_hi()
    if vim.api.nvim_eval("&previewwindow") ~= 0 then
        vim.opt.syntax = "markdown"
    end
end

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.rs"},
    callback = start_rust_analyzer
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.py"},
    callback = start_pylsp
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.c", "*.h"},
    callback = start_clangd
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*"},
    callback = preview_hi
})
