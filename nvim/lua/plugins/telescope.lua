return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  lazy = true,
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require("telescope").setup({
      pickers = {
        find_files = {
          hidden = true
        }
      }
    })
  end
}
