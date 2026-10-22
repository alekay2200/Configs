-- Buscar y reemplazar en todo el proyecto (<leader>S)
return {
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = { live_update = true },
}
