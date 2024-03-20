local nvim_tree = require("plugins.nvim-tree")
local treesitter = require("plugins.treesitter")
local comment = require("plugins.comment")
local surround = require("plugins.surround")
local lspconfig = require("plugins.lsp.lspconfig")
local telescope = require("plugins.telescope")
local gitsigns = require("plugins.gitsigns")
local fugitive = require("plugins.fugitive")
local cmp = require("plugins.cmp")
local toggleterm = require("plugins.toggleterm")
local lazygit = require("plugins.lazygit")
local bufferline = require("plugins.bufferline")
local vim_visual_multi = require("plugins.vim_visual_multi")
local align = require("plugins.align")

local plugins = {
  nvim_tree,
  treesitter,
  comment,
  surround,
  lspconfig,
  telescope,
  gitsigns,
  fugitive,
  cmp,
  toggleterm,
  lazygit,
  bufferline,
  vim_visual_multi,
  align
}

return plugins
