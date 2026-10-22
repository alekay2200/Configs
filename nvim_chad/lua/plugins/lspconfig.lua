-- Servidores LSP
return {
  "neovim/nvim-lspconfig",
  config = function()
    require("nvchad.configs.lspconfig").defaults()

    -- Los servidores se habilitan solos via mason-lspconfig (automatic_enable),
    -- ver lua/plugins/mason.lua. Aqui solo van los que necesitan opciones extra.
    -- Ver :h vim.lsp.config
    vim.diagnostic.config { virtual_text = false }

    local lspconfig = require "lspconfig"
    local util = require "lspconfig.util"

    lspconfig.rust_analyzer.setup {
      filetypes = { "rust" },
      root_dir = util.root_pattern "Cargo.toml",
      settings = {
        ["rust-analyzer"] = {
          cargo = { allFeatures = true },
        },
      },
    }

    lspconfig.gopls.setup {
      cmd = { vim.fn.stdpath "data" .. "/mason/bin/gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    }

    lspconfig.astro.setup {
      init_options = {
        typescript = {
          tsdk = vim.fn.stdpath "data"
            .. "/mason/packages/typescript-language-server/node_modules/typescript/lib",
        },
      },
    }
  end,
}
