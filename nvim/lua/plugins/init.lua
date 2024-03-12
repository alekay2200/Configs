local nvim_tree = require("plugins.nvim-tree")
local treesitter = require("plugins.treesitter")
local comment = require("plugins.comment")
local surround = require("plugins.surround")
local lspconfig = require("plugins.lsp.lspconfig")
local telescope = require("plugins.telescope")

local plugins = { nvim_tree, treesitter, comment, surround, lspconfig, telescope }

return plugins
