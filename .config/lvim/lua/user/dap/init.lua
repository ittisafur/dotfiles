local dap, dapui = require("dap"), require("dapui")

-- 1) dap-ui setup
dapui.setup()

-- 2) Auto-open dap-ui when a session starts
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
-- Auto-close dap-ui when session ends
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- 3) Load all your adapter configs
local adapters = { "js", "python", "go", "dart", "codelldb" }
for _, name in ipairs(adapters) do
  local ok, err = pcall(require, "user.dap." .. name)
  if not ok then
    vim.notify(
      string.format("🛑 Failed to load DAP adapter: user.dap.%s\n%s", name, err),
      vim.log.levels.ERROR
    )
  end
end
