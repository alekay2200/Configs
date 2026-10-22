-- Cierra/renombra tags HTML y JSX automaticamente
return {
  "windwp/nvim-ts-autotag",
  lazy = true,
  ft = {
    "html",
    "xml",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "astro",
    "vue",
    "svelte",
  },
  opts = {},
}
