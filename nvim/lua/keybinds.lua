local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<c-l>", ":vertical resize +1<CR>", opts)
keymap("n", "<c-h>", ":vertical resize -1<CR>", opts)
keymap("n", "<space>d", ":lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "<space>D", ":lua vim.diagnostic.open_float({scope='l'})<CR>", opts)
keymap("n", "<space>c", ":lua vim.cmd('pclose')<CR>", opts)
keymap("n", "<space>sc", ":setlocal spell spelllang=en_us<CR>", opts)
keymap("n", "<space>SC", ":setlocal nospell<CR>", opts)
keymap("n", "<space>rn", ":setlocal relativenumber<CR>", opts)
keymap("n", "<space>RN", ":setlocal norelativenumber<CR>", opts)

keymap("n", "<c-s>", ":echo synIDattr(synID(line('.'), col('.'), 1), 'name')<CR>", opts)

keymap("i", "{<cr>", "{<cr>}<c-o>O", opts)
keymap("i", "[<cr>", "[<cr>]<c-o>O", opts)
keymap("i", "(<cr>", "(<cr>)<c-o>O", opts)
keymap("i", "{<Space>", "{", opts)
keymap("i", "[<Space>", "[", opts)
keymap("i", "(<Space>", "(", opts)

keymap("v", "<s-k>", ":m .-2<CR>==<CR>k<s-v>", opts)
keymap("v", "<s-j>", ":m .+1<CR>==<s-v>", opts)
keymap("v", "<c-_>", "0<c-v><s-i>// <Esc>", opts)
keymap("v", "<Space>/", ":s/[/][/] /<CR>", opts)

keymap("n", "<c-n>", ":lua ToggleTerm()<CR>", opts)
keymap("t", "<c-n>", [[<c-\><c-n> :lua ToggleTerm()<CR>]], opts)
keymap("t", "<Esc>", [[<c-\><c-n>]], opts)
keymap("t", "<c-w><c-w>", [[<c-\><c-n><c-w>w]], opts)
keymap("t", "<c-w>w", [[<c-\><c-n><c-w>w]], opts)
