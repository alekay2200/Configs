local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

lspconfig.rust_analyzer.setup({
    filetypes = {"rust"},
    root_dir = util.root_pattern("Cargo.toml"),
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            }
        }
    }
})

lspconfig.gopls.setup({
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/gopls" },
    filetypes = {"go", "gomod", "gowork", "gotmpl"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git")
})

lspconfig.clangd.setup({
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/clangd" },
    filetypes = {"c", "cpp", "objc", "objcpp", "cuda"},

    capabilities = {
      offsetEncoding = { "utf-8", "utf-16" },
      textDocument = {
        completion = {
          editsNearCursor = true
        }
      }
    }
})
