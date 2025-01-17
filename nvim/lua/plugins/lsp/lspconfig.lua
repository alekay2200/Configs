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
    dependencies = { "mason-org/mason-registry" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "vtsls", -- JavaScript and TypeScript
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
          "bashls",
          "rust_analyzer"
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

      local util = require("lspconfig/util")
      local path = util.path

      lspconfig.lua_ls.setup(opts)
      lspconfig.vtsls.setup(opts)
      lspconfig.html.setup(opts)
      lspconfig.pyright.setup({
        capabilities = capabilities,
        filetype = {"pyton"},
        before_init = function(_, config)
          default_venv_path = path.join("./bin/python")
          config.settings.python.pythonPath = default_venv_path
        end
      })
      lspconfig.gopls.setup(opts)
      lspconfig.terraformls.setup(opts)
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        server = {
          cmd = { "rust-analyzer" },
          filetypes = { "rust" },
        },
      })
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

  {
    "jay-babu/mason-nvim-dap.nvim",
    lazy = false,
    config = function()
     require ('mason-nvim-dap').setup({
      -- Available adapters
      -- https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua
      ensure_installed = { "python", "delve", "codelldb" }, -- python, go, rust (debuggers)
      handlers = {
          function(config)
            -- all sources with no handler get passed here

            -- Keep original functionality
            require('mason-nvim-dap').default_setup(config)
          end,
          -- python = function(config)
          --     config.adapters = {
          --       type = "executable",
          --       command = "/usr/bin/python3",
          --       args = {
          --         "-m",
          --         "debugpy.adapter",
          --       },
          --     }
          --     require('mason-nvim-dap').default_setup(config) -- don't forget this!
          -- end,
      },
    })
    end
  },

  rust_tools
}

