print("✅ pluginsetup loader running")

local uv = vim.loop
-- point at the new folder name:
local plugin_dir = vim.fn.stdpath("config") .. "/lua/user/pluginsetup"

local handle = uv.fs_scandir(plugin_dir)
if not handle then
  vim.notify("⚠️  Could not scan pluginsetup dir: " .. plugin_dir,
    vim.log.levels.WARN)
  return
end

while true do
  local name, t = uv.fs_scandir_next(handle)
  if not name then break end

  -- only pick up *.lua files except init.lua
  if t == "file" and name:match("%.lua$") and name ~= "init.lua" then
    local mod = name:sub(1, -5) -- strip off “.lua”
    local ok, err = pcall(require, "user.pluginsetup." .. mod)
    if not ok then
      vim.notify(("⚠️  pluginsetup/%s.lua failed:\n%s"):format(mod, err),
        vim.log.levels.WARN)
    end
  end
end
