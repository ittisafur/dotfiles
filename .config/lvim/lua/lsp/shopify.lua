-- require("lvim.lsp.manager").setup("theme_check")
-- require'lspconfig'.theme_check.setup{
--     cmd = { "theme-check-language-server", "--stdio" },
--     filetypes = { "liquid" },
--     settings = {}
-- }
local theme_check_config = {
  cmd = { "theme-check-language-server", "--stdio" },
  filetypes = { "liquid" },
  root_dir = require 'lspconfig.util'.root_pattern(".git"),
  settings = {}
}
require("lvim.lsp.manager").setup("theme_check", theme_check_config)
