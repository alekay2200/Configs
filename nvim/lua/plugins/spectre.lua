return {
  "nvim-pack/nvim-spectre",
  dependencies = {"nvim-lua/plenary.nvim"},
  config = function()
    require("spectre").setup({
      live_update = true
    })
  end
}
