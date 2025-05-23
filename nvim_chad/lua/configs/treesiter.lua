local opts = {
		indent = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
		ensure_installed = {
			"markdown",
			"json",
			"javascript",
			"typescript",
			"yaml",
			"html",
			"css",
			"terraform",
			"bash",
			"lua",
			"dockerfile",
			"gitignore",
			"python",
			"rust",
			"go",
      "gowork",
      "gosum",
      "gomod"
		},
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
		},
}

return opts
