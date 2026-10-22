-- Parsers / syntax highlighting
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    -- Lenguajes que treesitter instala
    ensure_installed = {
      -- neovim
      "vim", "lua", "vimdoc",

      -- Web
      "html", "css", "tsx",
      "typescript", "javascript", "json",
      "astro",

      -- Lenguajes principales
      "rust", "go", "python",

      -- Config
      "yaml",

      -- IaC
      "terraform",
    },
  },
}
