local icon_pack = require("themes.icons")

return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    priority = 500,
    dependencies = { icon_pack },
    config = function()
      require("nvim-tree").setup {

        sort = {
            sorter = "case_sensitive",
          },
          view = {
            -- width = 60,
            width = vim.api.nvim_get_option("columns"),
            side = 'left',
          },
          renderer = {
            group_empty = false,
          },
          filters = {
            dotfiles = false,
          },
        actions = {
          open_file = {
            quit_on_open = true
          }
        },
      }
    end,
}
