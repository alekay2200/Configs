-- DAP (debug adapter protocol)


return {
 "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    "leoluz/nvim-dap-go",          -- Debbuger for GO
    "mfussenegger/nvim-dap-python" -- Debbuger for Python
  },
  lazy = false,
  config = function()
    require("dap-go").setup()

    local dap_python = require("dap-python")
    dap_python.setup("~/.virtualenvs/debugpy/bin/python")
    dap_python.test_runner = "unittest"

    local dap, dapui = require("dap"), require("dapui")

    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end
}
