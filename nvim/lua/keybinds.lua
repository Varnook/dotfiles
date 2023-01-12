local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<c-l>", ":vertical resize +1<CR>", opts)
keymap("n", "<c-h>", ":vertical resize -1<CR>", opts)
keymap("n", "<Space>d", ":lua vim.diagnostic.open_float()<CR>", opts)

keymap("i", "{<cr>", "{<cr>}<c-o>O", opts)
keymap("i", "[<cr>", "[<cr>]<c-o>O", opts)
keymap("i", "(<cr>", "(<cr>)<c-o>O", opts)
keymap("i", "{<Space>", "{", opts)
keymap("i", "[<Space>", "[", opts)
keymap("i", "(<Space>", "(", opts)

keymap("v", "<s-k>", ":m .-2<CR>==<CR>k<s-v>", opts)
keymap("v", "<s-j>", ":m .+1<CR>==<s-v>", opts)

keymap("n", "<c-n>", ":lua ToggleTerm()<CR>", opts)
keymap("t", "<c-n>", [[<c-\><c-n> :lua ToggleTerm()<CR>]], opts)
keymap("t", "<Esc>", [[<c-\><c-n>]], opts)
keymap("t", "<c-w><c-w>", [[<c-\><c-n><c-w><c-w>]], opts)
