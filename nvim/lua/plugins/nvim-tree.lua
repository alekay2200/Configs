return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      -- "kyazdani42/nvim-web-devicons"
    },
    config = function()
      require("nvim-tree").setup {

        sort = {
            sorter = "case_sensitive",
          },
          view = {
            width = 30,
          },
          renderer = {
            group_empty = true,
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
