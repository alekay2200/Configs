require "nvchad.autocmds"

local api = vim.api
local bo = vim.bo
local opt = vim.opt
local cmd = vim.cmd
local fn = vim.fn
local keymap = vim.keymap

-- Comandos de buffers (tabufline) -------------------------------------------
local tabufline_commands = {
  TabuflineNext = function() require("nvchad.tabufline").next() end,
  TabuflinePrev = function() require("nvchad.tabufline").prev() end,
  TabuflineCloseCurrent = function() require("nvchad.tabufline").close_buffer() end,
  TabuflineCloseLeft = function() require("nvchad.tabufline").closeBufs_at_direction "left" end,
  TabuflineCloseRight = function() require("nvchad.tabufline").closeBufs_at_direction "right" end,
  TabuflineMoveNext = function() require("nvchad.tabufline").move_buf(1) end,
  TabuflineMovePrev = function() require("nvchad.tabufline").move_buf(-1) end,
}

for name, fun in pairs(tabufline_commands) do
  api.nvim_create_user_command(name, fun, { nargs = 0 })
end

-- Indentacion por filetype: go y make usan tabs reales ----------------------
api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = "*",
  callback = function()
    opt.expandtab = not (bo.filetype == "go" or bo.filetype == "make")
  end,
})

-- Reajustar nvim-tree cuando cambia el tamano de la ventana -----------------
api.nvim_create_autocmd({ "VimResized" }, {
  group = api.nvim_create_augroup("NvimTreeResize", { clear = true }),
  callback = function()
    cmd("NvimTreeResize " .. vim.go.columns)
  end,
})

-- Ventana flotante con el diagnostico de la linea actual --------------------
api.nvim_create_autocmd("CursorHold", {
  group = api.nvim_create_augroup("DiagnosticFloat", { clear = true }),
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

-- :Align <texto> -> alinea la columna donde aparece <texto> en la seleccion --
local function align(opts)
  local text = opts.args
  local start_line = fn.line "'<" - 1
  local end_line = fn.line "'>"

  local lines = api.nvim_buf_get_lines(0, start_line, end_line, false)
  local new_lines = {}

  local big_index = 0
  for _, line in ipairs(lines) do
    local s, _ = string.find(line, text)
    if s ~= nil and big_index < s then big_index = s end
    table.insert(new_lines, { line = line, find_index = s })
  end

  local modified_lines = {}
  for _, entry in ipairs(new_lines) do
    local line = entry["line"]
    local index = entry["find_index"]
    local spaces = big_index - index
    local new = line
    if spaces > 0 then
      new = line:sub(1, index - 1) .. string.rep(" ", spaces) .. line:sub(index)
    end
    table.insert(modified_lines, new)
  end

  api.nvim_buf_set_lines(0, start_line, end_line, false, modified_lines)
end

api.nvim_create_user_command("Align", align, { nargs = 1, range = true })

-- KK en Go: `go doc` de la palabra bajo el cursor en un buffer nuevo --------
api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    keymap.set("n", "KK", function()
      local func_path = fn.expand "<cWORD>"
      -- Quita los parentesis: strings.Split(test) -> strings.Split
      func_path = func_path:match "([%a%d%._]+)"
      if func_path == "" then
        return
      end

      local buf = api.nvim_create_buf(true, false)
      api.nvim_set_current_buf(buf)

      local output = fn.systemlist("go doc " .. func_path)

      api.nvim_buf_set_lines(buf, 0, -1, false, output)
      bo.buftype = "nofile"
      bo.filetype = "go"
      api.nvim_buf_set_name(buf, "GoDoc: " .. func_path)

      keymap.set("n", "q", ":bd!<CR>", { buffer = buf, silent = true })
    end, { buffer = true, desc = "Show go doc for word under cursor" })
  end,
})

-- KK en C: man page de la palabra bajo el cursor ----------------------------
api.nvim_create_autocmd("FileType", {
  pattern = "c",
  callback = function()
    keymap.set("n", "KK", function()
      local func = fn.expand "<cword>"
      if func == "" then
        return
      end

      local buf = api.nvim_create_buf(true, false)
      api.nvim_set_current_buf(buf)

      cmd "enew"
      cmd("terminal man " .. func)
      bo.bufhidden = "wipe"
      cmd "startinsert"

      keymap.set("n", "q", ":bd!<CR>", { buffer = buf, silent = true })
    end, { buffer = true, desc = "Show man page for word under cursor" })
  end,
})
