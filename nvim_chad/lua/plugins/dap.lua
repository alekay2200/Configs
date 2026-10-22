-- Debugger (DAP) + interfaz
return {
  "mfussenegger/nvim-dap",
  lazy = true,
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "jay-babu/mason-nvim-dap.nvim",
    "nvim-neotest/nvim-nio",
    -- "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local mason_dap = require "mason-nvim-dap"
    local dap = require "dap"
    local ui = require "dapui"

    mason_dap.setup {
      ensure_installed = { "codelldb", "debugpy", "delve" },
      automatic_installation = true,
      handlers = {
        function(config)
          mason_dap.default_setup(config)
        end,

        delve = function()
          dap.adapters.go = {
            type = "server",
            port = "${port}",
            executable = {
              command = vim.fn.exepath "dlv",
              args = { "dap", "-l", "127.0.0.1:${port}", "--check-go-version=false" },
            },
          }

          dap.configurations.go = {
            {
              type = "go",
              name = "Debug",
              request = "launch",
              program = "${file}",
              console = "integratedTerminal",
            },
          }
        end,
      },
    }

    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = vim.fn.stdpath "data" .. "/mason/bin/codelldb",
        args = { "--port", "${port}" },
      },
    }

    dap.configurations.c = {
      {
        name = "Debug C",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/a.out", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        console = "internalConsole", -- stdout en la consola de dap-ui
      },
    }

    dap.configurations.cpp = dap.configurations.c

    -- Interfaz
    ui.setup()
    vim.fn.sign_define("DapBreakpoint", { text = "🔴" })

    dap.listeners.before.attach.dapui_config = function() ui.open() end
    dap.listeners.before.launch.dapui_config = function() ui.open() end
    dap.listeners.before.event_terminated.dapui_config = function() ui.close() end
    dap.listeners.before.event_exited.dapui_config = function() ui.close() end
  end,
}
