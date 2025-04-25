local util = require("lspconfig.util")

require("lvim.lsp.manager").setup("theme_check", {
  cmd       = { "theme-check-language-server", "--stdio" },
  filetypes = { "liquid" },
  root_dir  = util.root_pattern(".theme-check.yml", "config.yml", ".git"),
  on_attach = function(_, bufnr)
    vim.notify("🛍️ Shopify Theme-Check LSP attached", vim.log.levels.INFO)
  end,
})
