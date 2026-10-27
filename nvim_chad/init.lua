-- Entry point: solo bootstrap. Todo lo demas vive en lua/config y lua/plugins.
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = ","

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

-- Un archivo por plugin: lazy importa automaticamente todo lua/plugins/*.lua
require("lazy").setup({
  -- Base de NvChad primero: sus specs quedan como base y las nuestras las sobreescriben
  { "NvChad/NvChad", lazy = false, branch = "v2.5", import = "nvchad.plugins" },
  { import = "plugins" },
}, require "config.lazy")

-- tema (cache de base46, generado por NvChad)
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "config.options"
require "config.autocmds"

vim.schedule(function()
  require "config.mappings"
end)
