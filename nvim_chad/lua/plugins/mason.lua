-- Instalador de LSPs / herramientas
return {
  "mason-org/mason-lspconfig.nvim",
  lazy = false,
  opts = {
    -- Servidores LSP que mason instala automaticamente
    ensure_installed = {
      "gopls",
      "lua_ls",
      "pyright",
      "terraformls",

      -- Desarrollo web
      "ts_ls", -- Javascript y Typescript
      "astro", -- Framework de Javascript
    },
    automatic_enable = true,
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
}
