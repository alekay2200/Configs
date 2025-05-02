return {
  "navarasu/onedark.nvim",
  lazy = false,
  name = "onedark",
  priority = 1000,
  config = function()
    require("onedark").setup({
      style = "dark" -- dark, darker, cool, deep, warm, warmer
    })
  end
}

-- return {
--   "olimorris/onedarkpro.nvim",
--   priority = 1000, -- Ensure it loads first
-- }
