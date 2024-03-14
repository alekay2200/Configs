local rust_tools = require("plugins.lsp.rust_tools")

return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({})
    end
  },


  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver", -- JavaScript and TypeScript
          "html",
          "pyright",
          "gopls",
          "terraformls",
          "clangd", -- for C and C++
          "cmake", -- Make
          "dockerls",
          "jsonls",
          "marksman", -- Markdown
          "tailwindcss",
          "bashls"
        }
      })
    end
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp"
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local opts = {
        capabilities = capabilities
      }

      lspconfig.lua_ls.setup(opts)
      lspconfig.tsserver.setup(opts)
      lspconfig.html.setup(opts)
      lspconfig.pyright.setup(opts)
      lspconfig.gopls.setup(opts)
      lspconfig.terraformls.setup(opts)
      lspconfig.rust_analyzer.setup(opts)
      lspconfig.clangd.setup(opts)
      lspconfig.cmake.setup(opts)
      lspconfig.CMake.setup(opts)
      lspconfig.dockerls.setup(opts)
      lspconfig.jsonls.setup(opts)
      lspconfig.marksman.setup(opts)
      lspconfig.tailwindcss.setup(opts)
      lspconfig.bashls.setup(opts)
    end,
  },

  rust_tools
}

