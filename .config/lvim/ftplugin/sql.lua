-- Check if sqlls is installed or use sqls
local has_lspconfig, lspconfig = pcall(require, "lspconfig")
if not has_lspconfig then
  return
end

require("lvim.lsp.manager").setup("sqlls", {
  cmd = {"sql-language-server", "up", "--method", "stdio"};
  filetypes = {"sql", "mysql"};
  root_dir = function() return vim.loop.cwd() end;
})
