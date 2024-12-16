require("lvim.lsp.manager").setup("tsserver")

local formatters = require "lvim.lsp.null-ls.formatters"
local linters = require "lvim.lsp.null-ls.linters"

formatters.setup {
  {
    exe = "prettier",
    filetypes = {"javascriptreact"},
    args = {
      "--single-quote"
    }
  }
}

linters.setup {
  { command = "eslint_d", filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" } }
}
