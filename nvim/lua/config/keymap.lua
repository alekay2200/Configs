local keymap = vim.keymap
local lsp = vim.lsp
local builtin = require('telescope.builtin')

-- Window --
-- movement
keymap.set("n", "<C-h>", "<C-w>h", { noremap = false, silent = true })
keymap.set("n", "<C-j>", "<C-w>j", { noremap = false, silent = true })
keymap.set("n", "<C-k>", "<C-w>k", { noremap = false, silent = true })
keymap.set("n", "<C-l>", "<C-w>l", { noremap = false, silent = true })

-- split
keymap.set("n", "<leader>vs", "<cmd>vertical split<CR>", { noremap = false, silent = true })

-- Tabs
-- keymap.set("n", '<S-h>', '<cmd>-tabnext<cr>', { silent = true })
-- keymap.set("n", '<S-l>', '<cmd>+tabnext<cr>', { silent = true })

-- Buffers
keymap.set("n", '<S-h>', '<cmd>bprev<cr>', { silent = true })
keymap.set("n", '<S-l>', '<cmd>bnext<cr>', { silent = true })
keymap.set("n", '<leader>q', '<cmd>bdelete<CR>', { noremap = true, silent = true }) -- close current buffer
keymap.set("n", '<leader>ql', '<cmd>BufferLineCloseLeft<CR>', { noremap = true, silent = true }) -- close current buffer
keymap.set("n", '<leader>qr', '<cmd>BufferLineCloseRight<CR>', { noremap = true, silent = true }) -- close current buffer
-- keymap.set("n", '<S-l>', '<cmd>BufferModeNext<cr>', { silent = true })
-- keymap.set("n", '<S-l>', '<cmd>BufferModePrev<cr>', { silent = true })

-- Terminal mode
keymap.set("t", '<C-t>', '<C-\\><C-n>', { silent = true })
-- keymap.set("t", '<leader>g', '<cmd>LazyGit<CR>', { silent = true })
keymap.set("n", "<leader>g", "<cmd>LazyGit<CR>", {noremap = true, silent = true})
keymap.set("n", "<C-\\>", "<cmd>ToggleTerm direction=float<CR>", {noremap = true, silent = true})
keymap.set("t", "<C-\\>", "<cmd>ToggleTerm direction=float<CR>", {noremap = true, silent = true})

-- buffers 
-- keymap.set("n", "<S-h>", "<cmd>bprev<cr>", { desc = "Previous buffer", silent = true })
-- keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer", silent = true })

-- Movement
keymap.set("v", '<S-k>', ':move \'<-2<CR>gv-gv', { noremap = true, silent = true })
keymap.set("v", '<S-j>', ':move \'>+1<CR>gv-gv', { noremap = true, silent = true })

-- File explorer
keymap.set("n", "<leader>d", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Comments
-- Not working I dont know why :)
keymap.set("n", "<C-/>", "gcc", { noremap = false, silent = true})

-- LSP config --
-- shows a floating window with the function where the cursor is hovered 
keymap.set("n", "D", lsp.buf.hover, {})
-- go to definition
keymap.set("n", "gd", lsp.buf.definition, {})
-- go to implementations
keymap.set("n", "gi", lsp.buf.implementation, {})
-- go to references 
keymap.set("n", "gr", lsp.buf.references, {})
-- go back to previous file after jumping with one of this functions
keymap.set("n", "gbb", "<C-t>", { noremap = true, silent = true })
-- Show the list of code actions (the linter tell you to solve something in your code)
keymap.set("n", "<leader>ca", lsp.buf.code_action, {})


-- Telescope keymaps
keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fg', builtin.live_grep, {})
