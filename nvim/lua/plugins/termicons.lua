return {
  "mskelton/termicons.nvim",
  requires = { "nvim-tree/nvim-web-devicons" },
  build = false,
  lazy = false,
  config = function() require("termicons").setup() end
}