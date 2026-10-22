-- Explorador de archivos
return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  opts = {
    on_attach = function(bufnr)
      local api = require "nvim-tree.api"
      api.config.mappings.default_on_attach(bufnr)
      vim.keymap.set("n", "<CR>", api.node.open.edit, {
        desc = "nvim-tree: Open",
        buffer = bufnr,
        noremap = true,
        silent = true,
        nowait = true,
      })
    end,
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = vim.o.columns,
      side = "left",
    },
    renderer = {
      group_empty = false,
    },
    filters = {
      dotfiles = false,
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
  },
}
