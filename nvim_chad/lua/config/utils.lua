local M = {}

function M.open_claude_code_terminal()
  vim.cmd "vnew"
  vim.cmd "terminal claude"
  vim.bo.bufhidden = "wipe"
  vim.cmd "startinsert"
end

return M
