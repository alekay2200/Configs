-- Formateo de codigo
return {
  "stevearc/conform.nvim",
  -- event = "BufWritePre", -- descomentar para formatear al guardar
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      -- css = { "prettier" },
      -- html = { "prettier" },
    },

    -- format_on_save = {
    --   timeout_ms = 500,
    --   lsp_fallback = true,
    -- },
  },
}
