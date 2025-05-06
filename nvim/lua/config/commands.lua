local api = vim.api

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

-- Replace only in the selection
api.nvim_create_user_command(
  "Sreplace",
  function(opts)
    local input = opts.args
    local search, replace = unpack(vim.split(input, "/"))
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")
    local command = string.format("%s,%ss/\\%sV%s/%s/g", start_line, end_line, "%", vim.fn.escape(search, "/"), vim.fn.escape(replace, "/"))
    api.nvim_command(command)
  end,
  { nargs = 1, range = true }
)

api.nvim_create_user_command(
  "Problems",
  function()
    api.nvim_command("lua vim.diagnostic.setqflist()")
  end,
  { nargs = 0, range = false }
)

-- Run rust-analyzer on standalonefile
api.nvim_create_user_command("Rust", function() api.nvim_command("RustStartStandaloneServerForBuffer") end, { nargs = 0 })

-- `BufferLineCloseRight` - close all visible buffers to the right of the
--   current buffer
-- * `BufferLineCloseLeft` - close all visible buffers to the left of the current
--   buffer
-- * `BufferLineCloseOthers` - close all other visible buffers
