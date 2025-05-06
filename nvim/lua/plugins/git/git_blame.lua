-- Commands:
--  • :GitBlameToggle

return {
  "f-person/git-blame.nvim",
  -- Load the plugin at startup
  lazy = false,
  opst = {
  },
  config = function()
    require('gitblame').setup {
      message_template = " <author> / <date> • <summary>", -- " <summary> • <date> • <author> • <<sha>>"
      date_format = "%r",
      enabled = false,
      virtual_text_column = 1,
      highlight_group = "Question",
    }
  end
}
