require "nvchad.mappings"

-- add yours here

local builtin = require('telescope.builtin')
local map = vim.keymap.set
local lsp = vim.lsp
local diagnostic = vim.diagnostic

-- Window --
-- movement
map("n", "<C-h>", "<C-w>h", { noremap = false, silent = true })
map("n", "<C-j>", "<C-w>j", { noremap = false, silent = true })
map("n", "<C-k>", "<C-w>k", { noremap = false, silent = true })
map("n", "<C-l>", "<C-w>l", { noremap = false, silent = true })

-- File explorer
map("n", "<leader>dd", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- split
map("n", "<leader>vs", "<cmd>vertical split<CR>", { noremap = false, silent = true })

-- Buffers
map("n", '<S-h>', '<cmd>TabuflinePrev<cr>', { noremap = true, silent = true })
map("n", '<S-l>', '<cmd>TabuflineNext<cr>', { noremap = true, silent = true })
map("n", '<leader>qb', '<cmd>TabuflineCloseCurrent<CR>', { noremap = true, silent = true }) -- close current buffer
map("n", '<leader>qr', '<cmd>TabuflineCloseRight<CR>', { noremap = true, silent = true }) -- close buffers to right 
map("n", '<leader>ql', '<cmd>TabuflineCloseLeft<CR>', { noremap = true, silent = true }) -- close buffers to right 
map("n", '>', '<cmd>TabuflineMoveNext<CR>', { noremap = true, silent = true })
map("n", '<', '<cmd>TabuflineMovePrev<CR>', { noremap = true, silent = true })

-- Comments
map("n", "<C-/>", "gcc", { noremap = false, silent = true })

-- LSP config --
-- shows a floating window with the function where the cursor is hovered 
map("n", "D", lsp.buf.hover, {})
-- go to definition
map("n", "gd", lsp.buf.definition, {})
-- go to implementations
map("n", "gi", lsp.buf.implementation, {})
-- go to references 
map("n", "gr", lsp.buf.references, {})
-- go back to previous file after jumping with one of this functions
map("n", "gbb", "<C-t>", { noremap = true, silent = true })
-- Show the list of code actions (the linter tell you to solve something in your code)
map("n", "<leader>ca", lsp.buf.code_action, {})
-- Refactor names
map("n", "<leader>r", lsp.buf.rename, { noremap = true })

-- Telescope keymap
map('n', '<leader>ff', builtin.find_files, {})
map('n', '<leader>fg', builtin.live_grep, {})

-- Diagnostic movement
map("n", "gn", diagnostic.goto_next)
map("n", "gb", diagnostic.goto_prev)