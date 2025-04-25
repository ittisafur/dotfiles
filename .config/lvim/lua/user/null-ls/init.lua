local null_ls = require("null-ls")
local methods = null_ls.methods

local sources = {}

for _, mod in ipairs({ "shopify", "python", "rust" }) do
  local ok, m = pcall(require, "user.null-ls." .. mod)
  if ok and type(m) == "table" then
    vim.list_extend(sources, m)
  else
    vim.notify("null-ls: failed to load module " .. mod, vim.log.levels.WARN)
  end
end

null_ls.setup({
  debug     = false,
  sources   = sources,
  on_attach = function(client, bufnr)
    -- format on save if the server supports it
    if client.supports_method(methods.FORMATTING) then
      vim.api.nvim_clear_autocmds({ buffer = bufnr, event = "BufWritePre" })
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function() vim.lsp.buf.format({ bufnr = bufnr }) end,
      })
    end
  end,
})
