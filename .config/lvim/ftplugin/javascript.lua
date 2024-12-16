local formatters = require "lvim.lsp.null-ls.formatters"
local linters = require "lvim.lsp.null-ls.linters"
formatters.setup {
  {
    exe = "prettier",
    filetypes = {"javascript"},
    args = {
      "--print-width", 
      "120",
      "--single-quote"
    }
  }
}

linters.setup {
  { command = "eslint_d", filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" } }
}

