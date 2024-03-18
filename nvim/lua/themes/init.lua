local catppuccin = require("themes.catppuccin")
local nightfox = require("themes.nightfox")
local feline = require("themes.feline")
local onedark = require("themes.onedark")

-- disabling themes that are not going to be used
catppuccin.lazy = false 
nightfox.lazy = true


local themes = { catppuccin, nightfox, feline, onedark }
-- local current_theme = "catppuccin-mocha"
local current_theme = "onedark"

return {
    themes = themes,
    current_theme = current_theme
}
