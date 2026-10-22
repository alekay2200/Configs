-- Autocompletado
return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  config = function()
    local cmp = require "cmp"

    cmp.setup {
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },

      mapping = cmp.mapping.preset.insert {
        ["<C-b>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-e>"] = cmp.mapping.abort(), -- cerrar el popup
        ["<CR>"] = cmp.mapping.confirm { select = false },
      },

      sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
      },
    }
  end,
}
