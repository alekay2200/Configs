-- Make sure to set `mapleader` before lazy so your mappings are correct 
require("config.global")
require("config.options")
require("config.commands")

local T = require("themes.init")
local P = require("plugins.init")

local plugins = {}
local opts = {
  defaults = {
    lazy = true, -- should plugins be lazy-loaded?
  },

  install = {
    -- install missing plugins on startup. This doesn't increase startup time.
    missing = true,
    -- try to load one of these colorschemes when starting an installation during startup
    colorscheme = { T.current_theme.name },
  },

  change_detection = {
    notify = true,
  }
}

-- Load theme to be installed by lazy 
for _, theme in pairs(T.themes) do
  table.insert(plugins, theme)
end

-- Load plugins
for _, plugin in pairs(P) do
  table.insert(plugins, plugin)
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins, opts)

-- This file contains keymaps for telescop plugin, we need to make sure that telescope is install after
-- executing this script file
require("config.keymap")
