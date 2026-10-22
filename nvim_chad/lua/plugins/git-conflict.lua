-- Resolucion de conflictos de merge
return {
  "akinsho/git-conflict.nvim",
  dependencies = { "yorickpeterse/nvim-pqf" },
  lazy = false,
  version = "*",
  config = function()
    require("pqf").setup()

    require("git-conflict").setup {
      default_mappings = {
        ours = "o",
        theirs = "t",
        none = "0",
        both = "b",
        next = "n",
        prev = "p",
      },
      default_commands = true,
      disable_diagnostics = true, -- desactiva diagnosticos mientras el buffer tiene conflictos
      list_opener = "copen",
      highlights = { -- necesitan color de fondo, si no se usa el default
        incoming = "DiffAdd",
        current = "DiffText",
      },
    }

    -- Parar el LSP mientras hay conflictos y reiniciarlo al resolverlos
    vim.api.nvim_create_autocmd("User", {
      pattern = "GitConflictDetected",
      callback = function()
        vim.notify("Conflict detected in file " .. vim.api.nvim_buf_get_name(0))
        vim.cmd "LspStop"
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "GitConflictResolved",
      callback = function()
        vim.cmd "LspRestart"
      end,
    })
  end,
}
