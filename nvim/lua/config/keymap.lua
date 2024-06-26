local keymap = vim.keymap
local lsp = vim.lsp
local diagnostic = vim.diagnostic
local builtin = require('telescope.builtin')
local dap = require("dap")
local diagnostic = vim.diagnostic
local dap_python = require("dap-python")

-- Window --
-- movement
keymap.set("n", "<C-h>", "<C-w>h", { noremap = false, silent = true })
keymap.set("n", "<C-j>", "<C-w>j", { noremap = false, silent = true })
keymap.set("n", "<C-k>", "<C-w>k", { noremap = false, silent = true })
keymap.set("n", "<C-l>", "<C-w>l", { noremap = false, silent = true })

-- split
keymap.set("n", "<leader>vs", "<cmd>vertical split<CR>", { noremap = false, silent = true })

-- Buffers
keymap.set("n", '<S-h>', '<cmd>BufferLineCyclePrev<cr>', { silent = true })
keymap.set("n", '<S-l>', '<cmd>BufferLineCycleNext<cr>', { silent = true })
keymap.set("n", '<leader>qb', '<cmd>bdelete<CR>', { noremap = true, silent = true }) -- close current buffer
keymap.set("n", '<leader>ql', '<cmd>BufferLineCloseLeft<CR>', { noremap = true, silent = true }) -- close buffers to left
keymap.set("n", '<leader>qr', '<cmd>BufferLineCloseRight<CR>', { noremap = true, silent = true }) -- close buffers to right 
keymap.set("n", '>', '<cmd>BufferLineMoveNext<CR>', { noremap = true, silent = true }) --  
keymap.set("n", '<', '<cmd>BufferLineMovePrev<CR>', { noremap = true, silent = true }) -- close current buffer

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
keymap.set("n", "<leader>dd", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

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

-- Diagnostic
-- go to next error/warning/hint
keymap.set("n", "<leader>n", diagnostic.goto_next, {})
keymap.set("n", "<leader>b", diagnostic.goto_prev, {})

-- -- DAP (debuger adapt protocol)
keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
keymap.set("n", "<leader>dc", dap.continue, {})
-- Python 
keymap.set("n", "<leader>ds", dap_python.debug_selection, {})

-- Spectre plugin commands
-- toggle spectre
keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})

-- search and replace on current file
keymap.set('n', '<leader>sf', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})

-- Diagnostic movement
keymap.set("n", "gn", diagnostic.goto_next)
keymap.set("n", "gb", diagnostic.goto_prev)
