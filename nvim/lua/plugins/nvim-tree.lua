-- To use web devicons
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

-- -- -- To use material icons
-- return {
--   'DaikyXendo/nvim-tree.lua',
--   dependencies = {
--     'DaikyXendo/nvim-material-icon', -- optional, for file icons
--   },
--   lazy = false,
--   config = function()
--     require("nvim-tree").setup({
--       sort_by = "case_sensitive",
--       view = {
--         adaptive_size = true,
--         mappings = {
--           list = {
--             { key = "u", action = "dir_up" },
--           },
--         },
--       },
--       renderer = {
--         group_empty = true,
--       },
--       filters = {
--         dotfiles = true,
--       },
--     })
--   end
-- }
