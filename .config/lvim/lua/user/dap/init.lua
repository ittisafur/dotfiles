local config_p = vim.fn.stdpath("config") .. "/lua/user/dap/"
local adapters = {
  "js",       -- js.lua
  "python",   -- python.lua
  "go",       -- go.lua
  "dart",     -- dart.lua
  "codelldb", -- codelldb.lua
}

for _, name in ipairs(adapters) do
  local file = config_p .. name .. ".lua"
  if vim.loop.fs_stat(file) then
    local ok, err = pcall(require, "user.dap." .. name)
    if not ok then
      vim.notify(
        string.format("🛑 Error loading DAP adapter %s:\n%s", name, err),
        vim.log.levels.ERROR
      )
    end
  end
end
