require "nvchad.autocmds"

local api = vim.api
local bo = vim.bo
local opt = vim.opt
local cmd = vim.cmd

-- Buffer Custom commands
-- Next buffer
api.nvim_create_user_command(
    "TabuflineNext",
    function() require("nvchad.tabufline").next() end,
    { nargs = 0 }
)

-- Prev Buffer command
api.nvim_create_user_command(
    "TabuflinePrev",
    function() require("nvchad.tabufline").prev() end,
    { nargs = 0 }
)

-- Prev Buffer command
api.nvim_create_user_command(
    "TabuflinePrev",
    function() require("nvchad.tabufline").prev() end,
    { nargs = 0 }
)

api.nvim_create_user_command(
    "TabuflineCloseCurrent",
    function() require("nvchad.tabufline").close_buffer() end,
    { nargs = 0 }
)

api.nvim_create_user_command(
    "TabuflineCloseLeft",
    function() require("nvchad.tabufline").closeBufs_at_direction("left") end,
    { nargs = 0 }
)

api.nvim_create_user_command(
    "TabuflineCloseRight",
    function() require("nvchad.tabufline").closeBufs_at_direction("right") end,
    { nargs = 0 }
)

api.nvim_create_user_command(
    "TabuflineMoveNext",
    function() require("nvchad.tabufline").move_buf(1) end,
    { nargs = 0 }
)

api.nvim_create_user_command(
    "TabuflineMovePrev",
    function() require("nvchad.tabufline").move_buf(-1) end,
    { nargs = 0 }
)


-- Disable expandtab option for go files
api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*",
    callback = function()
      if bo.filetype == "go" then
        opt.expandtab = false
      elseif bo.filetype == "make" then
        opt.expandtab = false
      else
        opt.expandtab = true
      end
    end
})

-- Resize nvimtree if the window was resized
api.nvim_create_autocmd({ "VimResized" }, {
  group = api.nvim_create_augroup("NvimTreeResize", { clear = true }),
  callback = function()
    local width = vim.go.columns
    cmd("NvimTreeResize " .. width)
  end,
})
