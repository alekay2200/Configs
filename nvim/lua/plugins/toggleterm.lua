return {
  'akinsho/toggleterm.nvim',
  lazy = false,
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = vim.o.lines * 0.5
    })
 end
}
