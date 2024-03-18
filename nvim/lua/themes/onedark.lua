return {
  "navarasu/onedark.nvim",
  lazy = false,
  name = "onedark",
  config = function()
    require("onedark").setup({
      style = "dark" -- dark, darker, cool, deep, warm, warmer
    })
  end
}
