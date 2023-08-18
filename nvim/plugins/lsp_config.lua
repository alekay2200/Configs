require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "pyright", "rust_analyzer", "tsserver" },
})

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup {}
lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}
lspconfig.rust_analyzer.setup {
	settings = {
		['rust-analyzer'] = {},
	},
}
