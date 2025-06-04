local null_ls = require("null-ls")
local methods = null_ls.methods
local config_path = vim.fn.stdpath("config") .. "/lua/user/null-ls/"

local sources = {}
local modules = { "shopify", "python", "rust" }

for _, mod in ipairs(modules) do
  local file = config_path .. mod .. ".lua"
  if vim.loop.fs_stat(file) then
    -- module file exists; try loading it
    local ok, m = pcall(require, "user.null-ls." .. mod)
    if ok then
      if type(m) == "table" then
        vim.list_extend(sources, m)
      else
        vim.notify(
          ("null-ls: module %s did not return a table"):format(mod),
          vim.log.levels.WARN
        )
      end
    else
      vim.notify(
        ("null-ls: error loading module %s:\n%s"):format(mod, m),
        vim.log.levels.WARN
      )
    end
    -- else: file doesn't exist → silently skip
  end
end

null_ls.setup({
  debug     = false,
  sources   = sources,
  on_attach = function(client, bufnr)
    if client.supports_method(methods.FORMATTING) then
      vim.api.nvim_clear_autocmds({ buffer = bufnr, event = "BufWritePre" })
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function() vim.lsp.buf.format({ bufnr = bufnr }) end,
      })
    end
  end,
})
