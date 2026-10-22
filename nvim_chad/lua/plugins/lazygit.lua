-- Interfaz de git
return {
  "kdheepak/lazygit.nvim",
  lazy = false,
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  dependencies = { "nvim-lua/plenary.nvim" },

  keys = {
    {
      "<leader>g",
      function()
        _G.LAZYGIT_PREV_WIN = vim.api.nvim_get_current_win()
        vim.cmd "LazyGit"
      end,
      desc = "Open Lazy git",
    },
  },

  config = function()
    vim.g.lazygit_floating_window_use_plenary = 0
    vim.g.lazygit_floating_window_scaling_factor = 1.0
    vim.g.lazygit_floating_window_winblend = 0
    vim.g.lazygit_floating_window_border_chars = { "", "", "", "", "", "", "", "" }

    -- Llamado desde lazygit (via `os.edit`/`os.editAtLine` en su config.yml, a traves
    -- de `nvim --remote-expr`) para que los archivos se abran en la ventana/buffer que
    -- estaba activa antes de que la ventana flotante de lazygit tomara el control, en
    -- vez de dentro de esa flotante. Cierra el float y mata su job primero, igual que
    -- hace el on_exit de lazygit.nvim, para que el estado del plugin quede consistente
    -- y <leader>g siga funcionando despues.
    _G.lazygit_open_file = function(filename, line)
      local lazygit_buf = _G.LAZYGIT_BUFFER
      local lazygit_win = lazygit_buf and vim.fn.bufwinid(lazygit_buf) or -1

      local target_win = _G.LAZYGIT_PREV_WIN
      if not target_win or target_win == lazygit_win or not vim.api.nvim_win_is_valid(target_win) then
        target_win = vim.fn.win_getid(vim.fn.winnr "#")
      end
      if target_win == 0 or target_win == lazygit_win then
        target_win = nil
        for _, w in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
          if w ~= lazygit_win and vim.api.nvim_win_get_config(w).relative == "" then
            target_win = w
            break
          end
        end
      end

      if lazygit_win ~= -1 and vim.api.nvim_win_is_valid(lazygit_win) then
        vim.api.nvim_win_close(lazygit_win, true)
      end
      if lazygit_buf and vim.api.nvim_buf_is_valid(lazygit_buf) then
        local job_id = vim.b[lazygit_buf].terminal_job_id
        if job_id then
          vim.fn.jobstop(job_id)
        end
        vim.api.nvim_buf_delete(lazygit_buf, { force = true })
      end
      _G.LAZYGIT_BUFFER = nil
      _G.LAZYGIT_LOADED = false
      vim.g.lazygit_opened = 0

      if not target_win or not vim.api.nvim_win_is_valid(target_win) then
        vim.cmd "vsplit"
        target_win = vim.api.nvim_get_current_win()
      end

      vim.api.nvim_set_current_win(target_win)
      vim.cmd("edit " .. vim.fn.fnameescape(filename))
      if line and tonumber(line) then
        pcall(vim.api.nvim_win_set_cursor, 0, { tonumber(line), 0 })
      end
    end
  end,
}
