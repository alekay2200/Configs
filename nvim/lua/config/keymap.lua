local keymap = vim.keymap

-- Movement
keymap.set("v", '<S-k>', ':move \'<-2<CR>gv-gv', { noremap = true, silent = true })
keymap.set("v", '<S-j>', ':move \'>+1<CR>gv-gv', { noremap = true, silent = true })

-- File explorer
keymap.set("n", "<leader>d", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Comments
-- Not working I dont know why :)
keymap.set("n", "<C-/>", "gcc", { noremap = false })
