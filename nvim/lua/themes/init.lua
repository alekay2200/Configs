local catppuccin = require("themes.catppuccin")
local nightfox = require("themes.nightfox")
local feline = require("themes.feline")

local themes = { catppuccin, nightfox, feline }
local current_theme = "catppuccin-mocha"

return {
    themes = themes,
    current_theme = current_theme
}
