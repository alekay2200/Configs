return {
  "Vonr/align.nvim",
  branch = "v2",
  lazy = false,
  config = function()
    -- Setup keymaps here 
    -- Aligns to a string with previews
    vim.keymap.set(
      'x',
      'al',
      function()
          require'align'.align_to_string({
              preview = true,
              regex = false,
          })
      end,
      { noremap = true, silent = true }
)
  end
}
