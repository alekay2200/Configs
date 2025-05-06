local git_conflict = require("plugins.git.git_conflict")
local lazygit = require("plugins.git.lazygit")
local nvr = require("plugins.git.nvr")
local gitsigns = require("plugins.git.gitsigns")
local git_blame = require("plugins.git.git_blame")

return { git_conflict, lazygit, nvr, gitsigns, git_blame }
