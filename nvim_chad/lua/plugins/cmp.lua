-- Autocompletado
return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  config = function()
    local cmp = require "cmp"
    -- Base de NvChad: expansion de snippets (LuaSnip), sources y estilo base46.
    -- Encima van solo nuestros cambios.
    local opts = require "nvchad.configs.cmp"

    opts.completion = { completeopt = "menu,menuone,preview,noselect" }

    opts.mapping["<C-b>"] = cmp.mapping.select_prev_item()
    opts.mapping["<C-n>"] = cmp.mapping.select_next_item()
    opts.mapping["<C-e>"] = cmp.mapping.abort() -- cerrar el popup
    opts.mapping["<CR>"] = cmp.mapping.confirm { select = false }

    cmp.setup(opts)
  end,
}
