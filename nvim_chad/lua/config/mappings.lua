require "nvchad.mappings"

local map = vim.keymap.set
local lsp = vim.lsp
local diagnostic = vim.diagnostic
local utils = require "config.utils"

-- Movimiento entre ventanas -------------------------------------------------
map("n", "<C-h>", "<C-w>h", { noremap = false, silent = true })
map("n", "<C-j>", "<C-w>j", { noremap = false, silent = true })
map("n", "<C-k>", "<C-w>k", { noremap = false, silent = true })
map("n", "<C-l>", "<C-w>l", { noremap = false, silent = true })
map("t", "<C-h>", "<C-\\><C-n><C-w>h", { noremap = false, silent = true })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { noremap = false, silent = true })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { noremap = false, silent = true })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { noremap = false, silent = true })
map("t", "<S-Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- Mover lineas en visual
map("v", "<S-k>", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })
map("v", "<S-j>", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })

-- Indentacion: mantiene la seleccion despues de indentar
map("v", ">", ">gv", { noremap = true, silent = true })
map("v", "<", "<gv", { noremap = true, silent = true })

-- Ventanas / splits ---------------------------------------------------------
map("n", "<leader>vs", "<cmd>vertical split<CR>", { noremap = false, silent = true })

-- Buffers -------------------------------------------------------------------
map("n", "<S-h>", "<cmd>TabuflinePrev<cr>", { noremap = true, silent = true })
map("n", "<S-l>", "<cmd>TabuflineNext<cr>", { noremap = true, silent = true })
map("n", "<leader>qb", "<cmd>TabuflineCloseCurrent<CR>", { noremap = true, silent = true })
map("n", "<leader>qr", "<cmd>TabuflineCloseRight<CR>", { noremap = true, silent = true })
map("n", "<leader>ql", "<cmd>TabuflineCloseLeft<CR>", { noremap = true, silent = true })
map("n", ">", "<cmd>TabuflineMoveNext<CR>", { noremap = true, silent = true })
map("n", "<", "<cmd>TabuflineMovePrev<CR>", { noremap = true, silent = true })

-- Comentarios ---------------------------------------------------------------
map("n", "<C-/>", "gcc", { noremap = false, silent = true })

-- LSP -----------------------------------------------------------------------
map("n", "D", lsp.buf.hover, { desc = "LSP hover" })
map("n", "gd", lsp.buf.definition, { desc = "LSP definition" })
map("n", "gi", lsp.buf.implementation, { desc = "LSP implementation" })
map("n", "gr", lsp.buf.references, { desc = "LSP references" })
map("n", "gbb", "<C-t>", { noremap = true, silent = true, desc = "Volver al salto anterior" })
map("n", "<leader>ca", lsp.buf.code_action, { desc = "LSP code action" })
map("n", "<leader>r", function()
  require "nvchad.lsp.renamer"()
end, { desc = "LSP rename (nvchad)" })

-- Diagnosticos
map("n", "gn", function() diagnostic.jump { count = 1, float = true } end, { desc = "Diagnostico siguiente" })
map("n", "gb", function() diagnostic.jump { count = -1, float = true } end, { desc = "Diagnostico anterior" })

-- Explorador de archivos ----------------------------------------------------
map("n", "<leader>dd", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle nvim-tree" })

-- Telescope -----------------------------------------------------------------
map("n", "<leader>ff", function() require("telescope.builtin").find_files() end, { desc = "Buscar archivos" })
map("n", "<leader>fg", function() require("telescope.builtin").live_grep() end, { desc = "Buscar en archivos" })

-- Spectre (buscar y reemplazar) ---------------------------------------------
map("n", "<leader>S", function() require("spectre").toggle() end, { desc = "Toggle Spectre" })

-- Neotest -------------------------------------------------------------------
map("n", "<leader>tr", function() require("neotest").run.run() end, { desc = "Run single test" })

-- Claude Code ---------------------------------------------------------------
map("n", "<leader>cc", utils.open_claude_code_terminal, { desc = "Abrir Claude Code en split" })

-- DAP (debugger) ------------------------------------------------------------
map("n", "<leader>do", function() require("dapui").open() end, { desc = "Abrir menu de debug" })
map("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Toggle breakpoint" })
map("n", "<leader>dc", function() require("dap").continue() end, { desc = "DAP continue" })
map("n", "<leader>dn", function() require("dap").step_over() end, { desc = "DAP step over" })
map("n", "<leader>di", function() require("dap").step_into() end, { desc = "DAP step into" })
map("n", "<leader>dq", function()
  require("dap").terminate()
  require("dapui").close()
end, { desc = "Cerrar menu de debug" })
