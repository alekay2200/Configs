return {
  "mskelton/termicons.nvim",
  requires = { "nvim-tree/nvim-web-devicons" },
  build = false,
  lazy = false,
  priority = 1,
  dependencies = {"nvim-tree/nvim-tree.lua", "nvim-tree/nvim-web-devicons"},
  config = function() require("termicons").setup() end
}
