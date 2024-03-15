local api = vim.api
local cmd = vim.cmd

function surround_add(opts)
  local char = opts.args
  local key_sequence = "ysiw" .. char
  api.nvim_input(key_sequence)
end


function surround_change(opts)
  input = opts.args
  if #input ~= 2 then return end

  local old_char = string.sub(input, 1, 1)
  local new_char = string.sub(input, 2, 2)
  local key_sequence = "cs" .. old_char .. new_char
  print(key_sequence)
  api.nvim_input(key_sequence)
end

function make_string()
  local key_sequence = 'ys$"'
  api.nvim_input(key_sequence)
end

function surround_delete(opts)
  local char = opts.args
  local key_sequence = "ysiw" .. char
  api.nvim_input(key_sequence)
end


-- Char to surround selection 
api.nvim_create_user_command(
    "SA",
    surround_add,
    { nargs = 1 })

api.nvim_create_user_command(
    "SC",
    surround_change,
    { nargs = 1 }
)

api.nvim_create_user_command(
    "MS",
    make_string,
    { nargs = 0 }
)

api.nvim_create_user_command(
    "SD",
    surround_delete,
    { nargs = 1 }
)

-- `BufferLineCloseRight` - close all visible buffers to the right of the
--   current buffer
-- * `BufferLineCloseLeft` - close all visible buffers to the left of the current
--   buffer
-- * `BufferLineCloseOthers` - close all other visible buffers
