local keymap = vim.keymap

-- Window movement
keymap.set("n", "<C-h>", "<C-w>h", { noremap = false, silent = true })
keymap.set("n", "<C-j>", "<C-w>j", { noremap = false, silent = true })
keymap.set("n", "<C-k>", "<C-w>k", { noremap = false, silent = true })
keymap.set("n", "<C-l>", "<C-w>l", { noremap = false, silent = true })

-- Movement
keymap.set("v", '<S-k>', ':move \'<-2<CR>gv-gv', { noremap = true, silent = true })
keymap.set("v", '<S-j>', ':move \'>+1<CR>gv-gv', { noremap = true, silent = true })

-- File explorer
keymap.set("n", "<leader>d", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Comments
-- Not working I dont know why :)
keymap.set("n", "<C-/>", "gcc", { noremap = false, silent = true})
