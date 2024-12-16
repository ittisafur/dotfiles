local dap, dapui = require("dap"), require("dapui")

dapui.setup()

-- Open DAP UI automatically when debugging starts
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

-- Close DAP UI when debugging ends
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
