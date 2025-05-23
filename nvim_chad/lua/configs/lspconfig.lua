require("nvchad.configs.lspconfig").defaults()

local servers = {
    "vtsls", -- JavaScript and TypeScript
    "cssls",
    "lua_ls",
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

vim.lsp.enable({"gopls"})

-- read :h vim.lsp.config for changing options of lsp servers 
