return {
  'akinsho/bufferline.nvim',
  lazy = false,
  version = "*",
  dependencies =  {'nvim-tree/nvim-web-devicons'},
  config = function()
    vim.opt.termguicolors = true

    require("bufferline").setup({
      options = {
        mode = "buffer",
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = "true"
          }
        },

        numbers = "buffer id",

        -- -- Diagnostics are showed in the bottom bar
        -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
        --   local s = " "
        --   for e, n in pairs(diagnostics_dict) do
        --     local sym = e == "error" and " "
        --       or (e == "warning" and " " or "" )
        --     s = s .. n .. sym
        --   end
        --   return s
        -- end
      }
    })
  end
}
